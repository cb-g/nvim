return {

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },

  {
    'hrsh7th/nvim-cmp',
    -- event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()
      cmp.setup({
        formatting = lsp_zero.cmp_format({ details = true }),
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          ['<C-Enter>'] = cmp.mapping.confirm({ select = true }),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    cmd = {
      'LspInfo',
      'LspInstall',
      'LspStart',
    },
    event = {
      'BufReadPre',
      'BufNewFile',
    },
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()
      lsp_zero.on_attach(
        function(_, bufnr)
          lsp_zero.default_keymaps({ buffer = bufnr })
        end
      )

      require('mason-lspconfig').setup({
        ensure_installed = {
          'clangd', -- C, C++
          'dockerls', -- docker
          'elixirls', -- Elixir
          'elp', -- Erlang
          'html', -- HTML
			    'jsonls', -- JSON
          'julials', -- Julia			
          'ltex', -- LaTeX
			    'lua_ls', -- Lua
          'markdown_oxide', -- Markdown
          'ocamllsp', -- OCaml
          'pyright',  -- Python
          'r_language_server', -- R
          'rust_analyzer', -- Rust
          'sqlls', -- SQL
          'taplo', -- TOML
          'yamlls', -- YAML
          'zls', -- Zig
		},
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,

          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })

	    -- default virtual environment for Python
      local util = require("lspconfig/util")
      local path = util.path
      require('lspconfig').pyright.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        before_init = function(_, config)
          config.settings.python.pythonPath = path.join(vim.env.HOME, ".config", "venvs_py", ".default", "bin", "python")
        end,
      }
    end,
  },

  -- R
  {
    "R-nvim/R.nvim",
    lazy = false
    -- usage:
    -- the <LocalLeader> is '\' by default
    -- type <LocalLeader>rf to start the R console
    -- type <LocalLeader>d to run what's under the cursor
  },

  {
		"R-nvim/cmp-r"
	},

  -- julialang:
	{
		'JuliaEditorSupport/julia-vim'
	},

}

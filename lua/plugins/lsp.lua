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
      {'hrsh7th/cmp-nvim-lsp'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()
      cmp.setup({
        formatting = lsp_zero.cmp_format({ details = true }),
        mapping = cmp.mapping.preset.insert({
          ['<S-Space>'] = cmp.mapping.complete(),
          ['<S-u>'] = cmp.mapping.scroll_docs(-4),
          ['<S-d>'] = cmp.mapping.scroll_docs(4),
          ['<S-f>'] = cmp_action.luasnip_jump_forward(),
          ['<S-b>'] = cmp_action.luasnip_jump_backward(),
          ['<S-s>'] = cmp.mapping.confirm({ select = true }),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
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
          'texlab', -- LaTeX
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

          -- lua
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,

          -- latex
          texlab = function()
          require('lspconfig').texlab.setup{
            settings = {
              texlab = {
                auxDirectory = ".",
                bibtexFormatter = "texlab",
                build = {
                  args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                  executable = "latexmk",
                  onSave = false
                },
                chktex = {
                  onEdit = true,
                  onOpenAndSave = true
                },
                formatterLineLength = 80,
                forwardSearch = {
                  args = {}
                },
                latexFormatter = "latexindent",
                latexindent = {
                  modifyLineBreaks = true
                  }
                }
              }
            }
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

  -- julialang
	{
		'JuliaEditorSupport/julia-vim'
	},

  -- latex
  {
    "lervag/vimtex",
    lazy = false,
    -- tag = "v2.15",
    init = function()
      vim.g.vimtex_compiler_latexmk = {
      build_dir = 'build',
      continuous = 1,
      options = {
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-interaction=nonstopmode',
        '-synctex=1',
        },
      }
      vim.g.vimtex_quickfix_mode = 0
      local o = { noremap = true, silent = true }

      -- start continuous mode, which compiles upon saving
      vim.api.nvim_set_keymap('n', '<leader>ll', '<cmd>VimtexCompile<CR>', o)

      -- view pdf
      vim.api.nvim_set_keymap('n', '<leader>lv', '<cmd>VimtexView<CR>', o)

      -- clear auxiliary files
      vim.api.nvim_set_keymap('n', '<leader>lc', '<cmd>VimtexClean<CR>', o)

      -- more LaTeX-related keymaps:
      -- lua/keymaps.lua
    end,
  },

  {
    'ocaml/vim-ocaml',
    init = function()
      local home = os.getenv("HOME")
      vim.opt.runtimepath:append(home .. "/.opam/default/share/ocp-indent/vim")
    end,
  }

}

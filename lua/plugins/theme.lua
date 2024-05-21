return {

  -- start screen
  {
    'mhinz/vim-startify',
    -- config = function()
    --   vim.g.startify_custom_header = {
    --     [[                                                      ]],
    --     [[   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
    --     [[   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
    --     [[   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
    --     [[   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
    --     [[   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
    --     [[   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
    --     [[                                                      ]],
    --   }
    -- end
  },

  -- colors
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "kanagawa"
    end
  },

  -- syntax highlighting, indentation, folding, etc.
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require 'nvim-treesitter.configs'.setup({
        ensure_installed = {
          "bash",
          "bibtex",
          "c",
          "cpp",
          "csv",
          "dockerfile",
          "elixir",
          "erlang",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "go",
          "haskell",
          "json",
          "julia",
          "latex",
          "lua",
          "luadoc",
          "markdown",
          "markdown_inline",
          "ocaml",
          "ocaml_interface",
          "ocamllex",
          "python",
          "r",
          "regex",
          "rust",
          "scala",
          "sql",
          "tmux",
          "toml",
          "tsv",
          "vim",
          "vimdoc",
          "yaml",
          "zig",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { 
          enable = true 
        },
      })
    end
  },

}

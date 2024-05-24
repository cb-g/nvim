return {

  -- autocomplete brackets and quotes
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  },

  -- (un)comment all highlighted lines
  {
    'terrortylor/nvim-comment',
    config = function()
      require("nvim_comment").setup({ create_mappings = false })
      vim.keymap.set({"n", "v"}, "<leader>/", ":CommentToggle<cr>")
    end
  },

  -- save and load buffers automatically for each folder
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Downloads" },
      }
    end
  },

}

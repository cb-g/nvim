return {

  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('telescope').setup({
      vim.keymap.set("n", "<leader>fs", ":Telescope find_files<cr>"),
      vim.keymap.set("n", "<leader>fv", ":Telescope git_files<cr>"),
      vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>"),
      vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>"),
    })
  end,

}

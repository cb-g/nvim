return {

  -- :Git
  {
    "tpope/vim-fugitive",
  },

  -- git decorations
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },

}

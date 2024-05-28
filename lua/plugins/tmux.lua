return {

  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      local nvim_tmux_nav = require('nvim-tmux-navigation')
      local km = vim.keymap.set

      nvim_tmux_nav.setup {
        disable_when_zoomed = true
      }
      km('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      km('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateUp)
      km('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateDown)
      km('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      km('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      km('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end
  }

}

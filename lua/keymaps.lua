-- set leader key to space bar
vim.g.mapleader = " "

-- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- back-to-file-explorer (Netrw Directory Listing) shortcut
vim.keymap.set("n", "<leader>q", vim.cmd.Ex)

-- scroll through opened buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")

-- close the currently viewed buffer
vim.keymap.set("n", "<leader>x", ":bd<cr>")

-- switch 'j' and 'k' ...
-- ... in normal mode
vim.api.nvim_set_keymap('n', 'j', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'j', { noremap = true, silent = true })
-- ... in visual mode
vim.api.nvim_set_keymap('v', 'j', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'j', { noremap = true, silent = true })
-- ... in visual line mode
vim.api.nvim_set_keymap('x', 'j', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'k', 'j', { noremap = true, silent = true })
-- ... in select mode
vim.api.nvim_set_keymap('s', 'j', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('s', 'k', 'j', { noremap = true, silent = true })

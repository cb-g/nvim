-- shorthand
local km = vim.keymap.set
local akm = vim.api.nvim_set_keymap
local o = { noremap = true, silent = true }

-- set leader key to space bar
vim.g.mapleader = " "

-- yank to clipboard
km({"n", "v"}, "<leader>y", [["+y]])

-- back-to-file-explorer (Netrw Directory Listing) shortcut
km("n", "<leader>w", vim.cmd.Ex)

-- scroll through opened buffers
km("n", "<leader>m", ":bn<cr>")
km("n", "<leader>n", ":bp<cr>")

-- close the currently viewed buffer
km("n", "<leader>x", ":bd<cr>")

-- switch 'j' and 'k' ...
-- ... in normal mode
akm('n', 'j', 'k', o)
akm('n', 'k', 'j', o)
-- ... in visual mode
akm('v', 'j', 'k', o)
akm('v', 'k', 'j', o)
-- ... in visual line mode
akm('x', 'j', 'k', o)
akm('x', 'k', 'j', o)
-- ... in select mode
akm('s', 'j', 'k', o)
akm('s', 'k', 'j', o)

-- always center the view when jumping up and down half a page
akm('n', "<C-d>", "<C-d>zz", o)
akm('n', "<C-u>", "<C-u>zz", o)

-- always center the view when searching
akm('n', 'n', 'nzzzv', o)
akm('n', 'N', 'Nzzzv', o)

-- paste over something several times without losing the original copy
akm('x', '<leader>p', '"_dP', o)

-- black formatting for python. careful: auto-writes changes. 
km('n', '<leader>bf', ':!black "%"<cr>')

-- OCaml
-- dune
akm('n', '<leader>db', ':!dune build<CR>', o)
akm('n', '<leader>dr', ':!dune exec ./bin/main.exe<CR>', o)

-- LaTeX
-- remove auxiliary files from pwd
km('n', '<Leader>cl', '<cmd>!$HOME/.config/nvim/rm_latex_aux.sh<cr>')
-- single shot compilation
km('n', '<Leader>ss', ':VimtexCompileSS<cr>', o)

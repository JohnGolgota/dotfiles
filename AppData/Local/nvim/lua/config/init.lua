-- General configuration for Neovim
-- Keymaps
vim.keymap.set('n', '<C-s>', "<cmd>w<cr><esc>", { desc = 'Save File' })
vim.keymap.set('i', '<C-s>', "<cmd>w<cr><esc>", { desc = 'Save File' })
vim.keymap.set('x', '<C-s>', "<cmd>w<cr><esc>", { desc = 'Save File' })
vim.keymap.set('s', '<C-s>', "<cmd>w<cr><esc>", { desc = 'Save File' })
-- tab
vim.keymap.set('n', '<leader><tab>l', "<cmd>tablast<cr>", { desc = 'Last Tab' })
vim.keymap.set('n', '<leader><tab>f', "<cmd>tabfirst<cr>", { desc = 'First Tab' })
vim.keymap.set('n', '<leader><tab><tab>', "<cmd>tabnew<cr>", { desc = 'New Tab' })
vim.keymap.set('n', '<leader><tab>}', "<cmd>tabnext<cr>", { desc = 'Next Tab' })
vim.keymap.set('n', '<leader><tab>d', "<cmd>tabclose<cr>", { desc = 'Close Tab' })

vim.keymap.set('t', '<C-x>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Options
vim.opt.shell = "pwsh"
vim.opt.shellcmdflag = "-NoProfile -Command"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

vim.opt.cindent = true
vim.opt_local.cinoptions:append('s')

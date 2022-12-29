vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
-- Сохранить содержимое по CTRL-S
vim.keymap.set('n', '<C-s>', '<cmd>w!<CR>', default_opts)
-- Перемещение в режиме редактирования
vim.keymap.set('i', '<C-h>', '<left>', default_opts)
vim.keymap.set('i', '<C-j>', '<down>', default_opts)
vim.keymap.set('i', '<C-k>', '<up>', default_opts)
vim.keymap.set('i', '<C-l>', '<right>', default_opts)
-- Переключение вкладок (akinsho/bufferline.nvim)
vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', default_opts) --  go to next tab
vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', default_opts) --  go to previous tab
-- Переключение окон, закрытие, управление размером
vim.keymap.set('n', '<C-h>', '<C-w>h', default_opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', default_opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', default_opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', default_opts)
vim.keymap.set('n', '<leader>c', ':bd!<CR>', default_opts) -- закрыть текущий буфер
vim.keymap.set('n', '<leader>wc', '<C-w>c', default_opts) -- закрыть текущее окно
vim.keymap.set('n', '<leader>wv', '<C-w>v', default_opts) -- разделить по вертикали
vim.keymap.set('n', '<leader>ws', '<C-w>s', default_opts) -- разделить по горизонтали
vim.keymap.set('n', '<A-C-down>', '<C-w>-', default_opts)
vim.keymap.set('n', '<A-C-up>', '<C-w>+', default_opts)
vim.keymap.set('n', '<A-C-left>', '<C-w><', default_opts)
vim.keymap.set('n', '<A-C-right>', '<C-w>>', default_opts)
-- Move text up and down
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", default_opts)
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", default_opts)
-- Файловый менеджер
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = "File Explorer" })
vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = "LSP Diagnostic Open Float" })
-- Автокомплит для скобок
vim.keymap.set('i', '{', '{}<Esc>ha', default_opts)
vim.keymap.set('i', '(', '()<Esc>ha', default_opts)
vim.keymap.set('i', '[', '[]<Esc>ha', default_opts)
vim.keymap.set('i', [[']], [[''<Esc>ha]], default_opts)
vim.keymap.set('i', [["]], [[""<Esc>ha]], default_opts)

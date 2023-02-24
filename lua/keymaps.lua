vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Включить/отключить специальные символы
map('n', '<leader>ss', '<cmd>set list!<CR>', { desc = "Show special simbols" })
-- Сохранить содержимое по CTRL-S
map('n', '<C-s>', '<cmd>w!<CR>', default_opts)
-- Перемещение в режиме редактирования
map('i', '<C-h>', '<left>', default_opts)
map('i', '<C-j>', '<down>', default_opts)
map('i', '<C-k>', '<up>', default_opts)
map('i', '<C-l>', '<right>', default_opts)
-- Переключение вкладок (akinsho/bufferline.nvim)
map('n', '<S-l>', ':BufferLineCycleNext<CR>', default_opts) --  go to next tab
map('n', '<S-h>', ':BufferLineCyclePrev<CR>', default_opts) --  go to previous tab
-- Переключение окон, закрытие, управление размером
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<leader>c', ':bd!<CR>', { desc = "Close this buffer" }) -- закрыть текущий буфер
map('n', '<leader>wc', '<C-w>c', { desc = "Close this window" }) -- закрыть текущее окно
map('n', '<leader>w|', '<C-w>v', { desc = "Split window verical" }) -- разделить по вертикали
map('n', '<leader>w-', '<C-w>s', { desc = "Split window horizon" }) -- разделить по горизонтали
map('n', '<A-C-down>', '<C-w>-', default_opts)
map('n', '<A-C-up>', '<C-w>+', default_opts)
map('n', '<A-C-left>', '<C-w><', default_opts)
map('n', '<A-C-right>', '<C-w>>', default_opts)
-- Move text up and down
map("n", "<A-j>", "<cmd>m .+1<CR>==", default_opts)
map("n", "<A-k>", "<cmd>m .-2<CR>==", default_opts)
-- Перемещение по вертикали
map("n", "<C-d>", "<C-d>zz", default_opts)
map("n", "<C-u>", "<C-u>zz", default_opts)
-- Файловый менеджер
map('n', '<leader>e', '<cmd>NeoTreeShowToggle<CR>', { desc = "File Explorer" })

-- Diagnostic keymaps
map('n', '<leader>ld', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = "LSP Diagnostic Open Float" })
-- Автокомплит для скобок
map('i', '{', '{}<Esc>ha', default_opts)
map('i', '(', '()<Esc>ha', default_opts)
map('i', '[', '[]<Esc>ha', default_opts)
map('i', [[']], [[''<Esc>ha]], default_opts)
map('i', [["]], [[""<Esc>ha]], default_opts)
map('n', '[d', vim.diagnostic.goto_prev, { desc = "LSP Diagnostic Prev" })
map('n', ']d', vim.diagnostic.goto_next, { desc = "LSP Diagnostic Prev" })

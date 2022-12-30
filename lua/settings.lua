-- [[ Setting options ]]

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Copy and paste to system clipboard

vim.cmd [[set clipboard=unnamedplus]]

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
local enabled, _ = pcall(require, 'onedark')
if enabled then
    vim.cmd [[colorscheme onedark]]
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Other
vim.opt.cursorline = true
vim.opt.fileencoding = 'utf-8'
vim.opt.list = false
vim.opt.listchars = {
    tab = "▸ ",
    nbsp = "⍽",
    extends = "⟩",
    precedes = "⟨",
    trail = "-",
    space = ".",
    eol = "↲",
  }
-----------------------------------------------------------
-- Tabs
-----------------------------------------------------------
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftwidth = 2 -- shift 2 spaces when tab
vim.opt.tabstop = 2 -- 1 tab == 2 spaces
vim.opt.smartindent = true -- autoindent new lines

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

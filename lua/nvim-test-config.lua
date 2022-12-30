local enabled, ntest = pcall(require, 'nvim-test')
if not enabled then
  print("Nvim-test disabled")
  return
end

ntest.setup({
  term = "terminal", -- a terminal to run ("terminal"|"toggleterm")
  termOpts = {
    direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
    go_back = false, -- return focus to original window after executing
    stopinsert = "true", -- exit from insert mode (true|false|"auto")
    keep_one = true, -- keep only one terminal for testing
  }
})

vim.keymap.set('n', '<leader>ts', '<cmd>TestSuite<CR>', { desc = 'run the whole test suite' })
vim.keymap.set('n', '<leader>tf', '<cmd>TestFile<CR>', { desc = 'run all tests for the current file' })
vim.keymap.set('n', '<leader>tn', '<cmd>TestNearest<CR>', { desc = 'run the test nearest to the cursor' })
vim.keymap.set('n', '<leader>tl', '<cmd>TestLast<CR>', { desc = 'rerun the latest test' })

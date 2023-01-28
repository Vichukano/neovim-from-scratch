local enable, treesitter = pcall(require, 'nvim-treesitter.configs')
if not enable then
    print("Treesitter not found!")
    return
end

treesitter.setup({
    ensure_installed = { 'c', 'lua', 'rust', 'help', 'vim', 'java' },
    highlight = { enable = true },
    indent = { enable = true }
})

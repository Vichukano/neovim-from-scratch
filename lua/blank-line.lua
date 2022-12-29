local enabled, bl = pcall(require, "indent_blankline")
if not enabled then
    print("Indent blank line not found")
    return
end

bl.setup({
    show_trailing_blankline_indent = false,
    use_treesitter_scope = true,
    show_end_of_line = true,
})

require("persisted").setup({
    use_git_branch = true,
    autoload = true,
    before_save = function() 
        vim.cmd "NvimTreeClose"
    end,
})

return {
	"olimorris/persisted.nvim",
	config = function()
		require("persisted").setup({
			use_git_branch = true,
			autoload = true,
			before_save = function()
				vim.cmd("Neotree close")
			end,
		})
	end,
}

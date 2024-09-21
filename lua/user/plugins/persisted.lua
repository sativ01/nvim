return {
	"olimorris/persisted.nvim",
	lazy = false,
	config = function()
		require("persisted").setup({
			autostart = true,
			use_git_branch = true,
			autoload = true,
		})
	end,
}

return {
	"olimorris/codecompanion.nvim",
	lazy = true,
	event = { "BufReadPre", "VeryLazy" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
		{
			"stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
			opts = {},
		},
	},
	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "copilot",
				},
				inline = {
					adapter = false,
				},
				agent = {
					adapter = "copilot",
				},
			},
		})
	end,
}

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
					slash_commands = {
						["help"] = {
							callback = "strategies.chat.slash_commands.help",
							description = "Insert content from help tags",
							opts = {
								contains_code = false,
								max_lines = 128, -- Maximum amount of lines to of the help file to send (NOTE: each vimdoc line is typically 10 tokens)
								provider = "fzf_lua", -- telescope|mini_pick|fzf_lua
							},
						},
					},
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

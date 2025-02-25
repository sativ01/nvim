return {
	"olimorris/codecompanion.nvim",
	lazy = true,
	event = { "BufReadPre", "VeryLazy" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
		{
			"stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
			opts = {},
		},
	},
	config = function()
		require("codecompanion").setup({
			prompt_library = {
				["Test Expert"] = {
					strategy = "chat",
					description = "LLM tests",
					opts = {
						mapping = "<LocalLeader>at",
						modes = { "v" },
						short_name = "aitest",
						auto_submit = true,
						stop_context_insertion = true,
						-- user_prompt = true,
					},
					prompts = {
						{
							role = "system",
							content = function(context)
								return "I want you to act as a senior "
									.. context.filetype
									.. " developer. I will ask you specific questions and I want you to return concise explanations and codeblock examples."
							end,
						},
						{
							role = "user",
							content = function(context)
								local text = require("codecompanion.helpers.actions").get_code(
									context.start_line,
									context.end_line
								)
								return "You are writing React components and unit tests for them."
									.. "You are using @testing-library/react and vitest to create unit tests."
									.. "In the tests you are not mocking unnecessary function calls but strive to have integration tests."
									.. "Write unit tests for the following code: \n\n```"
									.. context.filetype
									.. "\n"
									.. text
									.. "\n```\n\n"
							end,
							opts = {
								contains_code = true,
							},
						},
					},
				},
			},
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

return {
	"pmizio/typescript-tools.nvim",
	event = { "BufReadPre *.ts,*.tsx,*.js,*.jsx", "BufNewFile *.ts,*.tsx,*.js,*.jsx" },
	dependency = { "nvim-lua/plenary.nvim", "nvim-lspconfig" },
	config = function()
		require("typescript-tools").setup({
			settings = {
				expose_as_code_action = { "all" },
				separate_diagnostic_server = true,
				publish_diagnostic_on = "insert_leave",
				tsserver_max_memory = 8096,
				complete_function_calls = false,
				jsx_close_tag = {
					enable = true,
					filetypes = { "typescriptreact" },
				},
			},
		})

		-- TS tools key maps
		vim.keymap.set("n", "<leader>io", "<cmd>TSToolsOrganizeImports<cr>", { desc = "Organize Imports" })
		vim.keymap.set("n", "<leader>ia", "<cmd>TSToolsAddMissingImports<cr>", { desc = "Add missing imports" })
		vim.keymap.set("n", "<leader>if", "<cmd>TSToolsFixAll<cr>", { desc = "Fix all imports" })
	end,
}

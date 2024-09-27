return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		local fzf = require("fzf-lua")
		fzf.setup({
			winopts = {
				width = 0.9,
				column = 0.45,
				row = 0.25,
				height = 0.9,
				preview = {
					delay = 300,
				},
				lsp = {
					jump_to_single_result = true,
				},
			},
		})
		vim.keymap.set("n", "<leader>f", ":FzfLua files<cr>", { desc = "Find file" })
		vim.keymap.set("n", "<leader>sl", ":FzfLua resume<cr>", { desc = "Open last search" })

		vim.keymap.set("n", "<leader>sr", function()
			fzf.oldfiles({ cwd = vim.fn.getcwd() })
		end, { desc = "Search recent" })

		vim.keymap.set("n", "<leader>ss", function()
			fzf.live_grep({ file_ignore_patterns = { "%.spec.", "%.test." } })
		end, { desc = "Search word without tests" })

		vim.keymap.set("n", "<leader>sst", ":FzfLua live_grep<cr>", { desc = "Search word with tests" })

		vim.keymap.set("n", "<leader>se", function()
			fzf.grep_cword({ file_ignore_patterns = { "%.spec.", "%.test." } })
		end, { desc = "Search word under cursor" })

		vim.keymap.set("n", "<leader>set", ":FzfLua grep_cword<cr>", { desc = "Search word under cursor" })
		vim.keymap.set("v", "<leader>se", ":FzfLua grep_visual<cr>", { desc = "Search selcted text" })
		vim.keymap.set("n", "<leader>sv", ":FzfLua lsp_document_symbols<cr>", { desc = "Search variables" })
		vim.keymap.set({ "v", "n" }, "<leader>sc", ":FzfLua spell_suggest<cr>", { desc = "Spell suggest" })

		vim.keymap.set("n", "gD", function()
			fzf.lsp_declarations()
		end, { desc = "Go to declaration" })

		vim.keymap.set("n", "gd", function()
			fzf.lsp_definitions({ jump_to_single_result = true })
		end, { desc = "Go to definition" })

		vim.keymap.set("n", "gv", function()
			fzf.lsp_definitions({ jump_to_single_result = true, jump_to_single_result_action = fzf.actions.file_vsplit })
		end, { desc = "Go to definition in split" })

		vim.keymap.set("n", "gm", function()
			fzf.git_status()
		end, { desc = "List git modified files" })
	end,
}

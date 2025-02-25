return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			-- 	-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
			-- save_on_toggle = false,
			-- 	-- saves the harpoon file upon every change. disabling is unrecommended.
			-- save_on_change = true,
			-- 	-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
			-- 	enter_on_sendcmd = false,
			-- 	-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
			-- 	tmux_autoclose_windows = false,
			-- 	-- filetypes that you want to prevent from adding to the harpoon list menu.
			-- 	excluded_filetypes = { "harpoon" },
			-- 	-- set marks specific to each git branch inside git repository
			-- 	mark_branch = true,
			-- 	-- enable tabline with harpoon marks
			-- 	tabline = false,
			-- 	tabline_prefix = "   ",
			-- 	tabline_suffix = "   ",
		})
		local toggle_opts = {
			border = "rounded",
			title_pos = "center",
			ui_width_ratio = 0.40,
		}
		vim.keymap.set("n", "<leader>m", function()
			harpoon:list():add()
		end, { desc = "Add harpoon mark" })
		vim.keymap.set("n", "<leader>md", function()
			harpoon:list():remove()
		end, { desc = "Remove harpoon mark" })
		vim.keymap.set("n", "<leader>l", function()
			harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
		end, { desc = "List all harpoon marks" })
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "Next file" })
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "Prev file" })
		local harpoon_extensions = require("harpoon.extensions")
		harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
	end,
}

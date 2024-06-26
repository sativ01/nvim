return {
	"ThePrimeagen/harpoon",
	config = function()
		require("harpoon").setup({
			-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
			save_on_toggle = false,
			-- saves the harpoon file upon every change. disabling is unrecommended.
			save_on_change = true,
			-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
			enter_on_sendcmd = false,
			-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
			tmux_autoclose_windows = false,
			-- filetypes that you want to prevent from adding to the harpoon list menu.
			excluded_filetypes = { "harpoon" },
			-- set marks specific to each git branch inside git repository
			mark_branch = true,
			-- enable tabline with harpoon marks
			tabline = false,
			tabline_prefix = "   ",
			tabline_suffix = "   ",
		})
		vim.keymap.set("n", "<leader>hh", function()
			require("harpoon.mark").toggle_file()
		end, { desc = "Add harpoon mark" })
		vim.keymap.set("n", "<leader>ha", function()
			require("harpoon.ui").toggle_quick_menu()
		end, { desc = "List all harpoon marks" })
		vim.keymap.set("n", "<leader>hn", function()
			require("harpoon.ui").nav_next()
		end, { desc = "Next file" })
		vim.keymap.set("n", "<leader>hp", function()
			require("harpoon.ui").nav_prev()
		end, { desc = "Prev file" })
	end,
}

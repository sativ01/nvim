return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		local bg = "#011628"

		-- setup custom theme colors
		require("tokyonight").setup({
			transparent = true,
			on_colors = function(colors)
				colors.bg = bg
			end,
		})
		vim.cmd("colorscheme tokyonight")
	end,
}

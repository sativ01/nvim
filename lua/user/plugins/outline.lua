return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	config = function()
		require("outline").setup({
			outline_window = {
				position = "left",
				width = 24,
				relative_width = true,
				auto_jump = true,
			},
			preview_window = {
				auto_preview = false,
			},
			symbol_folding = {
				-- Depth past which nodes will be folded by default. Set to false to unfold all on open.
				autofold_depth = false,
				-- When to auto unfold nodes
				auto_unfold = {
					-- Auto unfold currently hovered symbol
					hovered = true,
					-- Auto fold when the root level only has this many nodes.
					-- Set true for 1 node, false for 0.
					only = true,
				},
				markers = { "", "" },
			},
		})
	end,
}

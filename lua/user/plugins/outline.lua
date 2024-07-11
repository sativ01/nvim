return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	config = function()
		-- Example mapping to toggle outline
		vim.keymap.set("n", "<leader>oo", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

		require("outline").setup({
			position = "left",
			-- Your setup opts here (leave empty to use defaults)
		})
	end,
}

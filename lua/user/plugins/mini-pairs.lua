return {
	"echasnovski/mini.pairs",
	event = "VeryLazy",
	opts = {
		mappings = {
			["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\`].", register = { cr = false } },
			["("] = { action = "open", pair = "()", neigh_pattern = "[^\\(]." },
			["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\[]." },
			["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\{]." },
		},
	},
	keys = {
		{
			"<leader>up",
			function()
				vim.g.minipairs_disable = not vim.g.minipairs_disable
				if vim.g.minipairs_disable then
					print("Disabled auto pairs")
				else
					print("Enabled auto pairs")
				end
			end,
			desc = "Toggle Auto Pairs",
		},
	},
}

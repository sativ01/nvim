vim.api.nvim_create_autocmd({ "VimLeave" }, {
	desc = "Close all side panels",
	callback = function(args)
		vim.cmd("SymbolsOutlineClose")
	end,
})

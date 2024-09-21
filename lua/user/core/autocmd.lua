-- vim.api.nvim_create_autocmd({ "VimLeave" }, {
-- 	desc = "Close all side panels",
-- 	callback = function(args)
-- 		vim.cmd("OutlineClose")
-- 	end,
-- })

vim.api.nvim_create_autocmd("User", {
	pattern = "PersistedSavePre",
	callback = function()
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			if vim.bo[buf].filetype == "Outline" then
				vim.api.nvim_buf_delete(buf, { force = true })
				vim.cmd("OutlineClose")
			end
		end
	end,
})

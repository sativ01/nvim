-- filter out D.TS files from search
local function filter(arr, fn)
	if type(arr) ~= "table" then
		return arr
	end

	local filtered = {}
	for k, v in pairs(arr) do
		if fn(v, k, arr) then
			table.insert(filtered, v)
		end
	end
	return filtered
end

local function filterReactDTS(value)
	-- Depending on typescript version either uri or targetUri is returned
	if value.uri then
		return string.match(value.uri, "%.d.ts") == nil
	elseif value.targetUri then
		return string.match(value.targetUri, "%.d.ts") == nil
	end
end

return {
	"pmizio/typescript-tools.nvim",
	dependency = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		local handlers = {
			["textDocument/definition"] = function(err, result, method, ...)
				if vim.tbl_islist(result) and #result > 1 then
					local filtered_result = filter(result, filterReactDTS)
					return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
				end

				vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
			end,
		}

		require("typescript-tools").setup({
			handlers = handlers,
			settings = {
				-- expose_as_code_action = { "all" },
				separate_diagnostic_server = true,
				publish_diagnostic_on = "insert_leave",
				tsserver_max_memory = 8096,
				complete_function_calls = false,
			},
		})

		-- TS tools key maps
		vim.keymap.set("n", "<leader>io", "<cmd>TSToolsOrganizeImports<cr>", { desc = "Organize Imports" })
		vim.keymap.set("n", "<leader>ia", "<cmd>TSToolsAddMissingImports<cr>", { desc = "Add missing imports" })
		vim.keymap.set("n", "<leader>if", "<cmd>TSToolsFixAll<cr>", { desc = "Fix all imports" })
	end,
}

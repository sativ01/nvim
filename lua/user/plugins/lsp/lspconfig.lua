return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		-- LSP wrapper for vtsls.
		"yioneko/nvim-vtsls",
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

		function configure_server(server, settings)
			lspconfig[server].setup(
				vim.tbl_deep_extend("error", { capabilities = capabilities, silent = true }, settings or {})
			)
		end

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>FzfLua lsp_typedefs<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>la", ":FzfLua lsp_code_actions<cr>", opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>FzfLua diagnostics_document<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		-- local capabilities = cmp_nvim_lsp.default_capabilities()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		configure_server("eslint", {
			filetypes = {
				"graphql",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
			settings = { format = false },
		})
		configure_server("jsonls", {
			settings = {
				json = {
					validate = { enable = true },
				},
			},
			-- Lazy-load schemas.
			on_new_config = function(config)
				config.settings.json.schemas = config.settings.json.schemas or {}
				vim.list_extend(config.settings.json.schemas, require("schemastore").json.schemas())
			end,
		})
		-- Use the same settings for JS and TS.
		local lang_settings = {
			suggest = { completeFunctionCalls = true },
			inlayHints = {
				functionLikeReturnTypes = { enabled = true },
				parameterNames = { enabled = "literals" },
				variableTypes = { enabled = true },
			},
		}
		configure_server("vtsls", {
			settings = {
				typescript = lang_settings,
				javascript = lang_settings,
				vtsls = {
					-- Automatically use workspace version of TypeScript lib on startup.
					autoUseWorkspaceTsdk = true,
					experimental = {
						-- Inlay hint truncation.
						maxInlayHintLength = 30,
						-- For completion performance.
						completion = {
							enableServerSideFuzzyMatch = true,
						},
					},
				},
			},
		})

		configure_server("yamlls", {
			settings = {
				yaml = {
					-- Using the schemastore plugin instead.
					schemastore = {
						enable = false,
						url = "",
					},
				},
			},
			-- Lazy-load schemas.
			on_new_config = function(config)
				config.settings.yaml.schemas = config.settings.yaml.schemas or {}
				vim.list_extend(config.settings.yaml.schemas, require("schemastore").yaml.schemas())
			end,
		})
	end,
}

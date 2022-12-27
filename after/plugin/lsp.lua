local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<enter>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(_, bufnr)
  --[[ if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end ]]

  local nmap = function (keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end
      vim.keymap.set('n', keys, func, {buffer = bufnr, desc = desc})
  end

  nmap("gd", vim.lsp.buf.definition, 'Go to Definition')
  nmap("gI", vim.lsp.buf.implementation, 'Go to Implementation')
  nmap("K", vim.lsp.buf.hover, 'See documentation')
  nmap("<leader>lf", vim.diagnostic.open_float, 'Open float window')
  nmap("<leader>la", vim.lsp.buf.code_action, 'Choose code action')
  nmap("<leader>lr", vim.lsp.buf.rename, 'Rename')
  nmap("<leader>lR", require("telescope.builtin").lsp_references, 'Show references')
  nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, 'Workspace Symbols')
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, 'Document Symbols')
  nmap("<leader>D", vim.lsp.buf.type_definition, 'Type Definition')

  nmap("gD", vim.lsp.buf.declaration, 'Go to Declaration')

  -- Workspace
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace add folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace remove folder')
  nmap('<leader>wl', function ()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'Workspace list folders')



end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})



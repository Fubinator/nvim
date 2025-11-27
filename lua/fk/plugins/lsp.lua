local cmp = require('cmp')
local lsp = require('lsp-zero')
lsp.preset('recommended')

local on_attach = function (client, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gs", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<Space>r", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<Space>d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, opts)
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<Space>D", function() vim.diagnostic.goto_next({ border = "rounded" }) end, opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

lsp.on_attach = on_attach

lsp.setup()

local vue_language_server_path = '/home/fk/.yarn/bin/vue-language-server'

local lspconfig = require('lspconfig')

vim.lsp.config("vue_ls", {
  cmd = { vue_language_server_path, '--stdio' },
  filetypes = { 'vue' },
  root_dir = lspconfig.util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git'),
  on_attach = on_attach,
  init_options = {
      typescript = {
        tsdk = '/home/fk/.yarn/global/node_modules/typescript/lib',
      },
    }
})

local vue_typescript_plugin_path = '/home/fk/.config/yarn/global/node_modules/@vue/typescript-plugin'

local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_typescript_plugin_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
  enableForWorkspaceTypeScriptVersions = true,
}

vim.lsp.config("vtsls", {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})


cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  })
})

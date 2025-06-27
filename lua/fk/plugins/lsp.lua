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

-- require'lspconfig'.ts_tls.setup{
-- init_options = {
--   plugins = {
--     {
--       name = "@vue/typescript-plugin",
--       location = "/home/fk/.config/yarn/global/node_modules/@vue/typescript-plugin",
--       languages = {"javascript", "typescript", "vue"},
--     },
--   },
-- },
-- filetypes = {
--   "javascript",
--   "typescript",
--   "vue",
-- },
-- default_config = {
--   root_dir = [[root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")]],
-- },
-- on_attach = on_attach
-- }

-- local util = require 'lspconfig.util'
-- local function get_typescript_server_path(root_dir)
--   local project_root = util.find_node_modules_ancestor(root_dir)
--   return project_root and (util.path.join(project_root, 'node_modules', 'typescript', 'lib')) or ''
-- end

-- local volar_init_options = {
--   typescript = {
--     tsdk = '',
--   },
-- }
-- 
-- require'lspconfig'.volar.setup{
--   default_config = {
--     cmd = { 'vue-language-server', '--stdio' },
--     filetypes = { 'vue' },
--     root_dir = util.root_pattern 'package.json',
--     init_options = volar_init_options,
--     on_new_config = function(new_config, new_root_dir)
--       if
--         new_config.init_options
--         and new_config.init_options.typescript
--         and new_config.init_options.typescript.tsdk == ''
--       then
--         new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
--       end
--     end,
--   },
--   on_attach = on_attach
-- }
--

local vue_language_server_path = '/home/fk/.yarn/bin/vue-language-server'

local lspconfig = require('lspconfig')

lspconfig.ts_ls.setup {
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
      },
    },
  },
}

lspconfig.volar.setup {
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
}


cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  })
})

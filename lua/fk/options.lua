local options = {
  nu = true,
  relativenumber = true,
  clipboard = "unnamedplus",
  smartcase = true,
  smartindent = true,
  swapfile = false,
  backup = false,
  writebackup = false,
  undofile = true,
  fileencoding = "utf-8",
  expandtab = true,
  smarttab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  autoindent = true,
  mouse = "a",
  wrap = false,
  bg = "dark",
  termguicolors = true,
  hlsearch = false,
  incsearch = true,
  scrolloff = 8,
}


for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g["prettier#autoformat"] = 1
vim.g["prettier#autoformat_require_pragma"] = 0
vim.g["rustfmt_autosave"] = 1


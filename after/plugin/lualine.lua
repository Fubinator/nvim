require('lualine').setup{
  options = {
    theme = "nord"
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{ 'tabs', mode = 1, max_length =  vim.o.columns }},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  }
}

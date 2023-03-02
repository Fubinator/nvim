vim.cmd [[packadd packer.nvim]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    "windwp/nvim-autopairs", 
    wants= "nvim-treesitter",
    module = { "nvim-autoparis.completion.cmp", "nvim-autopairs" },
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  use 'tpope/vim-surround'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  --  use 'arcticicestudio/nord-vim'

  use { "catppuccin/nvim", as = "catppuccin" }

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use "airblade/vim-gitgutter"

  use {'akinsho/git-conflict.nvim', tag = "*", config = function()
    require('git-conflict').setup()
  end}

  use {'prettier/vim-prettier', run = { 'yarn install --frozen-lockfile --production' }, ft = {'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'vue', 'graphql', 'yaml', 'json'}}

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
  'VonHeikemen/lsp-zero.nvim',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    -- Snippet Collection (Optional)
    {'rafamadriz/friendly-snippets'},
  }
}
end)

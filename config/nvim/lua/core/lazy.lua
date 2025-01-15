local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

--Plugins
local plugins = {
	--Colorscheme
   {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        vim.g.gruvbox_material_enable_italic = true
      end
    },
   { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},

    --Autoclose
	{'m4xshen/autoclose.nvim'},

	--Lualine
	{'nvim-lualine/lualine.nvim',
    	dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

    --Telescope
    {'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    
    --Treesiter
    {'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
    },
   
    --LSP
    {
    	"neovim/nvim-lspconfig",
    	'VonHeikemen/lsp-zero.nvim', branch = 'v4.x',
      "williamboman/mason.nvim",
    },

    -- Autocomlete
    { 'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
	   'hrsh7th/cmp-path',
	   'hrsh7th/cmp-cmdline',
	   'hrsh7th/nvim-cmp',
	   'L3MON4D3/LuaSnip',
	   'saadparwaiz1/cmp_luasnip',
	},

   --Bar bar
   {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {},
    version = '^1.0.0',
  },

   --Code colors
  {'brenoprata10/nvim-highlight-colors'},

  --Alpha
  {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
   },
   --Rust
  {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
  },
}

require("lazy").setup(plugins, opts)

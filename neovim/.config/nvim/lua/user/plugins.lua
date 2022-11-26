local fn = vim.fn
local plugins = {
  -- Packer can manage itself
  ['wbthomason/packer.nvim'] = {},

  -- "gc" in visual mode to comment visual selection
  ['tpope/vim-commentary'] = {},

  -- Telescope
  ['nvim-lua/popup.nvim'] = {},
  ['nvim-lua/plenary.nvim'] = {},
  ['nvim-telescope/telescope.nvim'] = {
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    },
  },

  -- LSP
  ['neovim/nvim-lspconfig'] = {},
  ['ray-x/lsp_signature.nvim'] = {},

  -- Autocomplete
  ['hrsh7th/nvim-compe'] = {
    requires = {
      {'neovim/nvim-lspconfig'},
    },
  },
  ['hrsh7th/cmp-nvim-lsp'] = {
    -- config = function()
    --   require('plugins.cmp')
    -- end,
  },
  ['L3MON4D3/LuaSnip'] = {},

  -- Colorscheme and statusline
  ['ellisonleao/gruvbox.nvim'] = {},
  ['nvim-lualine/lualine.nvim'] = {},

  -- Copilot
  ['github/copilot.vim'] = {
    config = function()
      require('plugins.copilot')
    end,
  },

  -- GIT 
  ['tpope/vim-fugitive'] = {},
  ['f-person/git-blame.nvim'] = {
    config = function()
      require('plugins.gitblame')
    end,
  },
  ['lewis6991/gitsigns.nvim'] = {
    config = function()
      require('plugins.gitsigns')
    end,
    requires = {
      {'nvim-lua/plenary.nvim'},
    },
  },

  -- File tree
  ['kyazdani42/nvim-tree.lua'] = {
    config = function()
      require('plugins.nvim_tree')
    end,
    requires = {
      {'kyazdani42/nvim-web-devicons'},
    },
  },

  -- Scrollbar
  ['petertriho/nvim-scrollbar'] = {},

  -- Treesitter
  ['nvim-treesitter/nvim-treesitter'] = {
    run = ':TSUpdate',
  },
  ['nvim-treesitter/nvim-treesitter-textobjects'] = {},
  ['nvim-treesitter/nvim-treesitter-context'] = {},
  ['p00f/nvim-ts-rainbow'] = {},


  -- Autoformatter
  ['sbdchd/neoformat'] = {},

  -- Harpoon
  ['ThePrimeagen/harpoon'] = {},
}

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerInstall
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

local status_ok, packer = pcall(require, "packer")
if status_ok then
	packer.startup({
		function(use)
			for key, plugin in pairs(plugins) do
				if type(key) == "string" and not plugin[1] then
					plugin[1] = key
				end
				use(plugin)
				if plugin['config'] then
					plugin['config']()
				end
			end
		end,
		config = {
			display = {
				open_fn = function()
					return require("packer.util").float({ border = "rounded" })
				end,
			},
			profile = {
				enable = true,
				threshold = 0.0001,
			},
			git = {
				clone_timeout = 300,
				subcommands = {
					update = "pull --rebase",
				},
			},
			auto_clean = true,
			compile_on_sync = true,
		},
	})
end


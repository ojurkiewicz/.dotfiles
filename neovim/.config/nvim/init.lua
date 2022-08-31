-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

vim.cmd[[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]]
vim.cmd[[imap <silent><script><expr> <C-L> copilot#Next()]]
vim.cmd[[imap <silent><script><expr> <C-H> copilot#Previous()]]
vim.cmd[[let g:copilot_no_tab_map = v:true]]


local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'ellisonleao/gruvbox.nvim'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
 -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'ThePrimeagen/harpoon'
  use 'p00f/nvim-ts-rainbow'
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	use 'ray-x/lsp_signature.nvim'
	use 'sbdchd/neoformat'
	use("petertriho/nvim-scrollbar")
  use("preservim/nerdtree")
  use("nvim-lualine/lualine.nvim")
  use("L3MON4D3/LuaSnip")
  use "github/copilot.vim"
  use("tpope/vim-fugitive")
  use "folke/tokyonight.nvim"
  use {'nvim-orgmode/orgmode',
        config = function()
          require('orgmode').setup{}
        end
      }
  use { 'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
      }
end)

require "user.lualine"

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

--Incremental live completion (note: this is now a default on master)
vim.o.inccommand = 'nosplit'

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[let g:gruvbox_sign_column = '000000']])
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[highlight normal guibg=#000000]])
vim.cmd([[hi SignColumn guibg=#000000]])

vim.o.tabstop = 2;

vim.cmd([[
augroup fmt
  autocmd!
  au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END
]])

vim.api.nvim_command('set noshowmode')

-- Keep screen centered when going through search results
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })

-- Moving text around
vim.cmd([[noremap J :m '>+1<CR>gv=gv]])
vim.cmd([[noremap K :m '<-2<CR>gv=gv]])

-- Auto-closing brackets
vim.api.nvim_set_keymap('i', '"', '"<left>"', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '\'', '\'<left>\'', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '(', '()<left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[', '[]<left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '{', '{}<left>', { noremap = true, silent = true })

vim.cmd([[xnoremap <leader>p "_dP]])
vim.cmd([[noremap <leader>y "+y]])
vim.cmd([[vnoremap <leader>y "+y]])
vim.cmd([[nmap <leader>Y "+Y]])
vim.cmd([[nnoremap <leader>d "_d]])
vim.cmd([[vnoremap <leader>d "_d]])

-- jk as ESC
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
-- vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>w', "<cmd>:w<CR>", { noremap = true })

-- NERDtree keymaps
-- vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>:NERDTreeToggle<CR>]], { noremap = true })

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { hl = 'GitSignsAdd', text = '+' },
    change = { hl = 'GitSignsChange', text = '~' },
    delete = { hl = 'GitSignsDelete', text = '>' },
    topdelete = { hl = 'GitSignsDelete', text = '>' },
    changedelete = { hl = 'GitSignsChange', text = '~' },
  },
}

-- Telescope
local actions = require("telescope.actions")
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
				["<esc>"] = actions.close,
      },
    },
    file_ignore_patterns = {
	    "node_modules",
      ".git",
      "dist"
    }
  },
}

-- Org mode

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false, hidden = true})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sg', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

require("harpoon").setup({
    global_settings = {
        save_on_toggle = true,
        save_on_change = true,
        enter_on_sendcmd = false,
    },
})

-- Harpoon shortcuts
vim.api.nvim_set_keymap('n', '<leader>ha', [[<cmd>lua require("harpoon.mark").add_file()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h1', [[<cmd>lua require("harpoon.ui").nav_file(1)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h2', [[<cmd>lua require("harpoon.ui").nav_file(2)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h3', [[<cmd>lua require("harpoon.ui").nav_file(3)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h4', [[<cmd>lua require("harpoon.ui").nav_file(4)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h5', [[<cmd>lua require("harpoon.ui").nav_file(5)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hh', [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hq', [[<cmd>lua require("harpoon.tmux").gotoTerminal(1)<CR>]], { noremap = true, silent = true })

-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
   rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
   -- max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = false,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

vim.cmd([[let g:indent_blankline_use_treesitter = v:true
]])
vim.cmd([[let g:indent_blankline_show_current_context = v:true]])


-- LSP settings
local nvim_lsp = require 'lspconfig'
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'svelte', 'eslint', 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'sumneko_lua', 'gopls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

nvim_lsp.sumneko_lua.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

require "lsp_signature".setup({
  floating_window = false,
  hint_prefix = ""
})

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- Diffview config
local cb = require'diffview.config'.diffview_callback

-- Change lame dash dash sign to fancy diagonal
local set = vim.opt -- set options
set.fillchars = set.fillchars + 'diff:╱'

require('diffview').setup()

-- Scrollbar
require("scrollbar").setup({
				handle = {
								color = "#333333"
				},
				marks = {
        Search = { text = { "−", "▄" }, priority = 0, color = "orange" },
        Error = { text = { "−", "▄" }, priority = 1, color = "red" },
        Warn = { text = { "−", "▄" }, priority = 2, color = "yellow" },
        Info = { text = { "−", "▄" }, priority = 3, color = "#99be83" },
        Hint = { text = { "−", "▄" }, priority = 4, color = "#99be83" },
        Misc = { text = { "−", "▄" }, priority = 5, color = "purple" }
    }})


require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    custom = { "^.git$" }
  },
  git = {
    ignore = false,
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false
      }
    },
  }

})

vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>:NvimTreeToggle<CR>]], { noremap = true })

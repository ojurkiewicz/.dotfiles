-- Keep screen centered when going through search results
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })

-- Moving highlighted text around with J & K
vim.cmd([[noremap J :m '>+1<CR>gv=gv]])
vim.cmd([[noremap K :m '<-2<CR>gv=gv]])

-- Stay in indent 
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })

-- Don't wait for move when indenting
vim.api.nvim_set_keymap('n', '<', '<<', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '>', '>>', { noremap = true, silent = true })

-- Auto-closing brackets
vim.api.nvim_set_keymap('i', '"', '"<left>"', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '\'', '\'<left>\'', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '(', '()<left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[', '[]<left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '{', '{}<left>', { noremap = true, silent = true })

-- Center screen on C-d and C-u
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- Leader yank to clipboard
vim.api.nvim_set_keymap('v', '<leader>y', '"*y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>Y', '"*Y', { noremap = true, silent = true })

-- jk as ESC
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- SAVE ON LEADER W
vim.api.nvim_set_keymap('n', '<leader>w', "<cmd>:w<CR>", { noremap = true })

-- NVIM TREE
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>NvimTreeToggle<CR>', {noremap = true, silent = true})

-- COPILOT
vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<C-L>', 'copilot#Next()', {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<C-H>', 'copilot#Previous()', {noremap = true, silent = true, expr = true})

-- TELESCOPE
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false, hidden = true})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sg', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

-- Harpoon shortcuts
vim.api.nvim_set_keymap('n', '<leader>ha', [[<cmd>lua require("harpoon.mark").add_file()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h1', [[<cmd>lua require("harpoon.ui").nav_file(1)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h2', [[<cmd>lua require("harpoon.ui").nav_file(2)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h3', [[<cmd>lua require("harpoon.ui").nav_file(3)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h4', [[<cmd>lua require("harpoon.ui").nav_file(4)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h5', [[<cmd>lua require("harpoon.ui").nav_file(5)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hh', [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hq', [[<cmd>lua require("harpoon.tmux").gotoTerminal(1)<CR>]], { noremap = true, silent = true })

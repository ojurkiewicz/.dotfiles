return {
  'ThePrimeagen/harpoon',
  config = function()
    require("harpoon").setup({
        global_settings = {
            save_on_toggle = true,
            save_on_change = true,
            enter_on_sendcmd = false,
        },
    })

  -- Harpoon shortcuts
  vim.api.nvim_set_keymap('n', '<leader>ha', [[<cmd>lua require("harpoon.mark").add_file()<CR>]],
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>h1', [[<cmd>lua require("harpoon.ui").nav_file(1)<CR>]],
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>h2', [[<cmd>lua require("harpoon.ui").nav_file(2)<CR>]],
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>h3', [[<cmd>lua require("harpoon.ui").nav_file(3)<CR>]],
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>h4', [[<cmd>lua require("harpoon.ui").nav_file(4)<CR>]],
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>h5', [[<cmd>lua require("harpoon.ui").nav_file(5)<CR>]],
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>hh', [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]],
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>hq', [[<cmd>lua require("harpoon.tmux").gotoTerminal(1)<CR>]],
    { noremap = true, silent = true })

  end,
}

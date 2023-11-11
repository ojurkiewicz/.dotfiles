return {
  'github/copilot.vim',
  config = function()
     vim.cmd[[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]]
     vim.cmd[[imap <silent><script><expr> <C-L> copilot#Next()]]
     vim.cmd[[imap <silent><script><expr> <C-H> copilot#Previous()]]
     vim.cmd[[let g:copilot_no_tab_map = v:true]]
  end,
}

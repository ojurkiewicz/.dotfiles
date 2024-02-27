return {
  'github/copilot.vim',
  config = function()
    vim.cmd [[ 
      imap <silent><script><expr> <C-m> copilot#Accept("\<CR>")
    ]]
    vim.cmd [[
      let g:copilot_no_tab_map = v:true
    ]]
  end,
}

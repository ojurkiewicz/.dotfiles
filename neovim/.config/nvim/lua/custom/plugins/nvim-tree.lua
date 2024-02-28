return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      filters = {
        git_ignored = false,
      },
      view = {
        width = { min = 30, max = -1 },
      },
    }
  end,
}

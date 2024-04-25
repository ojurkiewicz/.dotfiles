return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      view = {
        width = {min = 30, max = -1},
      },
      filters = { 
        dotfiles = false,
        git_ignored = false,
      }
    }
  end,
}

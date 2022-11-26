local status_ok, nvim_tree = pcall(require, "nvim-tree")
print(status_ok)
if not status_ok then
  print("Nvimtree not found")
  return
end

nvim_tree.setup({
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

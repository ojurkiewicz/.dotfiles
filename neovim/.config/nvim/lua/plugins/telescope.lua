local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local status_ok_actions, actions = pcall(require, "telescope.actions")
if not status_ok_actions then
  return
end

telescope.setup {
  defaults = {
    mappings = {
      i = {
				["<esc>"] = actions.close,
      },
    },
    file_ignore_patterns = {
	    "node_modules/",
      ".git/",
      "dist/"
    },
  },
}

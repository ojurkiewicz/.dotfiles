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


local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')
local conf = require('telescope.config')
local E = {}

local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
    -- this is for status
    -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
    -- just do an if and return a different command
    if entry.status == '??' or 'A ' then
      return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value }
    end

    -- note we can't use pipes
    -- this command is for git_commits and git_bcommits
    return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!' }

  end
}

E.my_git_commits = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_commits(opts)
end

E.my_git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_bcommits(opts)
end

E.my_git_status = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_status(opts)
end

vim.cmd([[nnoremap <silent> <Leader>gla <cmd>lua require('ecosse.telescope').my_git_commits()<CR>]])
vim.cmd([[nnoremap <silent> <Leader>glc <cmd>lua require('ecosse.telescope').my_git_bcommits()<CR>]])
vim.cmd([[nnoremap <silent> <Leader>gs <cmd>lua require('ecosse.telescope').my_git_status()<CR>]])

return E

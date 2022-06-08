local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic", "nvim_lsp" },
	sections = { "error", "warn", "info", "hint"},
	symbols = { error = "ERR:", warn = "WARN:", info = "INFO:", hint ="HINT:" }, -- changes diff symbols
	colored = true,
	update_in_insert = true,
	always_visible = false,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = "+", modified = "~", removed = "-" }, -- changes diff symbols
  cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "powerline",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch, diagnostics, diff },
		lualine_c = {},
		lualine_x = { "filename", filetype },
	},
	tabline = {},
	extensions = {},
})

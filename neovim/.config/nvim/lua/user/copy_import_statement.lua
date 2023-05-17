local copy_import_statement = function()
	local file_name = vim.fn.expand("%:~:.")
	local module_name = file_name:gsub(".py", ""):gsub("/", ".")
	local symbol_name = vim.fn.expand("<cword>")
	local import_statement = "from " .. module_name .. " import " .. symbol_name
	vim.api.nvim_command("let @+ = '" .. import_statement .. "'")
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python" },
	callback = function()
		vim.keymap.set("n", "<leader>ys", copy_import_statement)
	end,
})

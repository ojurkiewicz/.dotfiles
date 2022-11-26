local status_ok, scrollbar = pcall(require, "scrollbar")
if not status_ok then
  return
end

scrollbar.setup({
				handle = {
								color = "#333333"
				},
				marks = {
        Search = { text = { "−", "▄" }, priority = 0, color = "orange" },
        Error = { text = { "−", "▄" }, priority = 1, color = "red" },
        Warn = { text = { "−", "▄" }, priority = 2, color = "yellow" },
        Info = { text = { "−", "▄" }, priority = 3, color = "#99be83" },
        Hint = { text = { "−", "▄" }, priority = 4, color = "#99be83" },
        Misc = { text = { "−", "▄" }, priority = 5, color = "purple" }
    }})

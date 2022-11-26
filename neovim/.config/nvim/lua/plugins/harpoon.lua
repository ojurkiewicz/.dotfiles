local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  return
end

harpoon.setup({
    global_settings = {
        save_on_toggle = true,
        save_on_change = true,
        enter_on_sendcmd = false,
    },
})

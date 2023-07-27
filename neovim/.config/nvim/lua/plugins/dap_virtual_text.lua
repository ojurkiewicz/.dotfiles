local status_ok, dapvt = pcall(require, "nvim-dap-virtual-text")
if not status_ok then
  print("NO DAP UI")
  return
end

dapvt.setup()

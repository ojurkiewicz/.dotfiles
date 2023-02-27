local status_ok, localhighlight = pcall(require, "local-highlight")
if not status_ok then
  return
end

localhighlight.setup({
     file_types = {'python', 'cpp', 'typescript', 'javascript', 'lua'},
     hlgroup = 'Visual',
 })



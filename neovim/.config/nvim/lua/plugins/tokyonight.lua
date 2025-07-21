return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    on_colors = function(colors)
      colors.bg = "#000000"
      colors.bg_statusline = "#000000"
      colors.bg_highlight = "#000000"
      colors.bg_sidebar = "#000000"
    end,
    on_highlights = function(hl, c)
      hl.Normal = { bg = "#000000" }
      hl.NormalNC = { bg = "#000000" }
      hl.NormalFloat = { bg = "#000000" }
      hl.FloatBorder = { bg = "#000000" }
      hl.Pmenu = { bg = "#000000" }
      hl.PmenuSel = { bg = "#1a1a1a" } -- optional contrast
      hl.StatusLine = { bg = "#000000" }
      hl.StatusLineNC = { bg = "#000000" }
      hl.TabLine = { bg = "#000000" }
      hl.TabLineFill = { bg = "#000000" }
      hl.TabLineSel = { bg = "#000000" }
      hl.WinSeparator = { bg = "#000000" }
      hl.VertSplit = { bg = "#000000" }
      hl.LineNr = { bg = "#000000" }
      hl.CursorLineNr = { bg = "#000000" }
      hl.SignColumn = { bg = "#000000" }
      hl.FoldColumn = { bg = "#000000" }
    end,
  },
}

--                          === Override highlights ===
local hl = vim.api.nvim_set_hl

local colors = {
	none = "NONE",
    bg0 = "#232120",
	bg1 = "#32302F",
	bg2 = "#665c54",

	-- Red
	color1 = "#ea6962",
	color9 = "#ea6962",
	-- Green
	color2  = "#a9b665",
	color10 = "#a9b665",
	-- Yellow
	color3  = "#d8a657",
	color11 = "#e78a4e",
	-- Blue
	color4  = "#7DAEA3",
	color12 = "#7DAEA3",
	-- Magenta
	color5  = "#d3869b",
	color13 = "#d3869b",
	-- Cyan
	color6  = "#89b482",
	color14 = "#89b482",
	-- White
	color7  = "#D4BE98",
	color15 = "#928374",

	-- Gray
    gray0 = "#A89984",
	gray1 = "#504945",
	gray2 = "#433E3A"
}
-- SpellBad       xxx cterm=undercurl gui=undercurl guisp=#ea6962
-- hl(0, 'SpellBad', { fg = colors.gray0,  bg = colors.none, undercurl = true })

-- hl(0, 'LineNr',   { fg = colors.color3,  bg = colors.none })
hl(0, 'Directory', { fg = colors.gray0,  bg = colors.none, bold = true })
hl(0, 'OilHidden', { fg = colors.gray0,  bg = colors.none})
hl(0, 'ColorColumn',   { fg = colors.gray2,    bg = colors.none })

hl(0, 'VisualNonText', { fg = colors.color7,  bg = colors.none })
hl(0, 'FloatBorder',   { fg = colors.color15, bg = colors.none })
hl(0, 'FloatBorder',   { fg = colors.color3,  bg = colors.none })

-- oil-git
hl(0, 'OilGitAdded',     { fg = colors.color2,  bg = colors.none })
hl(0, 'OilGitModified',  { fg = colors.color3,  bg = colors.none })
hl(0, 'OilGitRenamed',   { fg = colors.color11, bg = colors.none })
hl(0, 'OilGitUntracked', { fg = colors.color4,  bg = colors.none })
hl(0, 'OilGitIgnored',   { fg = colors.color15, bg = colors.none })

-- Flash
hl(0, 'FlashLabel',   { fg = colors.color4,  bg = colors.none })
hl(0, 'FlashCurrent', { fg = colors.color11, bg = colors.none })
hl(0, 'FlashMatch',   { fg = colors.color3,  bg = colors.none })

hl(0, "DiffAdd",    { fg = colors.none, bg = colors.bg1 })
hl(0, "DiffChange", { fg = colors.none, bg = colors.bg2 })
hl(0, "DiffDelete", { fg = colors.none, bg = colors.gray2 })
hl(0, "DiffText",   { fg = colors.none, bg = colors.color3 })

--[[
FlashBackdrop  
FlashCurrent
FlashCursor
FlashLabel
FlashMatch
FlashPrompt
FlashPromptIcon
]]

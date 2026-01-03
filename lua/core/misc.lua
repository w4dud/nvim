-- ========================
-- UTF-8 & terminal setup
-- ========================
vim.o.encoding      = "utf-8"
vim.o.fileencoding  = "utf-8"

-- ========================
-- Tab keymaps
-- ========================
vim.keymap.set("n", "<leader>tn", ":tabnew<cr>", { desc = "new [t]ab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<cr>", { desc = "e[x]clude tab" })
vim.keymap.set("n", "<leader>tt", function()
  if vim.o.showtabline == 2 then
    vim.o.showtabline = 0
  else
    vim.o.showtabline = 2
  end
end, { desc = "toggle [t]abs" })
vim.keymap.set("n", "]t", ":tabnext<cr>", { desc = "next tab", silent = true })
vim.keymap.set("n", "[t", ":tabprevious<cr>", { desc = "previous tab", silent = true })

-- ========================
-- Color palette
-- ========================
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
    -- Yellow / Orange
    color3  = "#d8a657",
    color11 = "#e78a4e",  -- let's use this for active tab
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

-- ========================
-- Gruvbox Material pill colors (using custom palette)
-- ========================
-- Active pill: orange background (color11), dark fg (bg0)
vim.api.nvim_set_hl(0, "tablinepillactiveleft",   { fg = colors.color11, bg = colors.bg0 })
vim.api.nvim_set_hl(0, "tablinepillactivetext",   { fg = colors.bg0,    bg = colors.color11 })
vim.api.nvim_set_hl(0, "tablinepillactiveright",  { fg = colors.color11, bg = colors.bg0 })

-- Inactive pill: gray background
vim.api.nvim_set_hl(0, "tablinepillinactiveleft", { fg = colors.gray0, bg = colors.bg0 })
vim.api.nvim_set_hl(0, "tablinepillinactivetext", { fg = colors.bg0,  bg = colors.gray0 })
vim.api.nvim_set_hl(0, "tablinepillinactiveright",{ fg = colors.gray0, bg = colors.bg0 })

-- Tabline fill
vim.api.nvim_set_hl(0, "tabline", { bg = colors.none, fg = colors.gray0 })
vim.api.nvim_set_hl(0, "tablinefill", { bg = colors.none })

-- ========================
-- Custom Japanese tab names
-- ========================
_G.tab_names = {
  "ホーム",      -- Tab 1 (Home)
  "編集",        -- Tab 2 (Edit)
  "設定",        -- Tab 3 (Settings)
  "ターミナル",  -- Tab 4 (Terminal)
  "ブラウズ",    -- Tab 5 (Browse)
}

-- ========================
-- Pill-style tabline function
-- ========================
function _G.pilltabline()
  local s = ""
  local tabs = vim.api.nvim_list_tabpages()
  local current = vim.api.nvim_get_current_tabpage()

  for i, tab in ipairs(tabs) do
    local is_active = (tab == current)

    local hl_left  = is_active and "%#tablinepillactiveleft#"   or "%#tablinepillinactiveleft#"
    local hl_text  = is_active and "%#tablinepillactivetext#"   or "%#tablinepillinactivetext#"
    local hl_right = is_active and "%#tablinepillactiveright#"  or "%#tablinepillinactiveright#"

    local name = _G.tab_names[i] or tostring(i)

    s = s .. hl_left .. ""
    s = s .. hl_text .. " " .. name .. " "
    s = s .. hl_right .. ""
    s = s .. "%#tabline# "
  end

  return s
end

-- Use our custom pill tabline
vim.o.tabline = "%!v:lua.pilltabline()"

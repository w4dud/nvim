-- ==========================================
-- map.lua - Full Keymaps for Neovim
-- ==========================================

local map = vim.keymap.set
local telescope = require 'telescope.builtin'

-- ==========================================
-- Basic File Operations
-- ==========================================
map('n', '<leader>w', '<CMD>w<CR>',        { desc = 'Save file' })
map('n', '<leader>q', '<CMD>q<CR>',        { desc = 'Quit buffer' })
map('n', '<leader>z', '<CMD>ZenMode<CR>',  { desc = 'Toggle Zen Mode' })

-- ==========================================
-- Navigation
-- ==========================================
map('n', '-',         '<CMD>Oil<CR>',                    { desc = 'Open parent directory' })
map('n', '<leader>o', '<CMD>Lspsaga outline<CR>',        { desc = 'Open outline' })

-- ==========================================
-- Code Running / Terminal
-- ==========================================
map('n', '<leader>R', '<CMD>RunCode<CR>',  { desc = 'Run Code' })
map('n', '<C-\\>',    '<CMD>ToggleTerm direction=vertical size=60<CR>', 
    { desc = 'Open vertical terminal' })

-- ==========================================
-- Telescope
-- ==========================================
map('n', '<leader>m', '<CMD>Telescope marks<CR>',   { desc = 'Telescope marks' })
map('n', '<leader>ff', telescope.find_files,        { desc = 'Telescope find files' })
map('n', '<leader>fg', telescope.live_grep,         { desc = 'Telescope live grep' })
map('n', '<leader>fb', telescope.buffers,           { desc = 'Telescope buffers' })
map('n', '<leader>fh', telescope.help_tags,         { desc = 'Telescope help tags' })

-- ==========================================
-- Git
-- ==========================================
map('n', '<leader>g', '<cmd>Fugit2<CR>', { desc = 'Open Fugit' })

-- ==========================================
-- LSP / Diagnostics
-- ==========================================
map('n', 'tl', function()
    vim.diagnostic.config {
        virtual_lines = not vim.diagnostic.config().virtual_lines
    }
end, { desc = 'Toggle diagnostic virtual_lines' })

-- ==========================================
-- DAP (Debug Adapter Protocol)
-- ==========================================
map('n', 'du', function()
    require('dapui').toggle()
end, { desc = 'Toggle DAP UI' })

-- ==========================================
-- Pane (Split) Resizing and Moving
-- ==========================================

-- Resize splits with Ctrl + h/j/k/l
--[[ map('n', '<C-h>', '<cmd>vertical resize -5<CR>', { desc = 'Shrink split horizontally (left)' })
map('n', '<C-l>', '<cmd>vertical resize +5<CR>', { desc = 'Expand split horizontally (right)' })
map('n', '<C-k>', '<cmd>resize +2<CR>',          { desc = 'Expand split vertically (up)' })
map('n', '<C-j>', '<cmd>resize -2<CR>',          { desc = 'Shrink split vertically (down)' }) ]]

-- Move the splits themselves with Ctrl + Shift + h/j/k/l
--[[ map('n', '<A-h>', '<C-w>H', { desc = 'Move current split to far left' })
map('n', '<A-l>', '<C-w>L', { desc = 'Move current split to far right' })
map('n', '<A-k>', '<C-w>K', { desc = 'Move current split to far top' })
map('n', '<A-j>', '<C-w>J', { desc = 'Move current split to far bottom' }) ]]

-- ==========================================
-- Notes / Plugins
-- ==========================================
-- Hydra: optional, install for modal keymap hints.
-- Move lines / blocks plugin commands intentionally left out.
--


-- Helper function
local map = vim.keymap.set

-- ===============================
-- Tabs: open, close, switch, move
-- ===============================

-- Open new tab
map('n', '<leader>tn', '<CMD>tabnew<CR>', { desc = 'New tab' })

-- Close current tab
map('n', '<leader>tc', '<CMD>tabclose<CR>', { desc = 'Close tab' })

-- Close all other tabs
map('n', '<leader>to', '<CMD>tabonly<CR>', { desc = 'Close other tabs' })

-- Scratch buffer in new tab
map('n', '<leader>ts', '<CMD>tabnew<CR><CMD>setlocal buftype=nofile bufhidden=hide noswapfile<CR>', { desc = 'Scratch buffer tab' })

-- Next / previous tab
map('n', '<leader>tl', '<CMD>tabnext<CR>', { desc = 'Next tab' })
map('n', '<leader>th', '<CMD>tabprevious<CR>', { desc = 'Previous tab' })

-- Optional: Ctrl-h/l for tab navigation
map('n', '<C-l>', '<CMD>tabnext<CR>', { desc = 'Next tab' })
map('n', '<C-h>', '<CMD>tabprevious<CR>', { desc = 'Previous tab' })

-- Move tab left / right
map('n', '<leader>tmh', '<CMD>tabmove -1<CR>', { desc = 'Move tab left' })
map('n', '<leader>tml', '<CMD>tabmove +1<CR>', { desc = 'Move tab right' })

-- Jump to specific tabs (1-9)
map('n', '<leader>t1', '1gt', { desc = 'Go to tab 1' })
map('n', '<leader>t2', '2gt', { desc = 'Go to tab 2' })
map('n', '<leader>t3', '3gt', { desc = 'Go to tab 3' })
map('n', '<leader>t4', '4gt', { desc = 'Go to tab 4' })
map('n', '<leader>t5', '5gt', { desc = 'Go to tab 5' })
map('n', '<leader>t6', '6gt', { desc = 'Go to tab 6' })
map('n', '<leader>t7', '7gt', { desc = 'Go to tab 7' })
map('n', '<leader>t8', '8gt', { desc = 'Go to tab 8' })
map('n', '<leader>t9', '9gt', { desc = 'Go to tab 9' })


map("n", "<leader>tr", function()

  local name = vim.fn.input("New tab name: ")
  if name ~= "" then
    _G.rename_tab(name)
  end
end, { desc = "Rename current tab" })

-- Map keys in terminal mode
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

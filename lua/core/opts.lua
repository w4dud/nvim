local o   = vim.o
local g   = vim.g
local opt = vim.opt

-- Set leader key
g.mapleader = ' '


o.shell          = '/usr/bin/env bash' -- Shell!!
o.laststatus     = 3                   -- Enable global statusline
o.clipboard      = 'unnamedplus'       -- Use system clipboard
o.spell          = true                -- For knowing how good am I in English :)
-- o.colorcolumn = '80' -- WARN: virt-column is being used for this purpose, no need to add it.

-- Line number
o.number         = true                -- Enable line numbers
o.relativenumber = true

-- Better search
o.ignorecase = true
o.smartcase  = true
o.hlsearch   = true
o.incsearch  = true

-- Tabs & indentation
o.tabstop     = 4
o.shiftwidth  = 4
o.expandtab   = true
o.smartindent = true

-- Appearance
o.termguicolors = true
o.signcolumn    = 'yes'
o.cursorline    = true

-- Save undo history
o.undofile = true

-- Disable swapfile
o.swapfile = true
o.backup   = false

opt.wrap = false -- Disable wrapping of lines

opt.hidden = true -- Keep buffers in background
opt.sessionoptions:append 'globals' -- Save global vars in sessions
opt.undofile = true -- Persistent undo
opt.lazyredraw = true -- Speed up macros
opt.shortmess:append 'c' -- Reduce completion messages

-- Set listchars
opt.list = true -- Enable list mode
opt.listchars = {
	space    = '·',
	tab      = '↦ ', -- Other suitible characters: │
	eol      = '↲',
	extends  = '»',
	precedes = '«',
	nbsp     = '␣',
	trail    = '›'
}

-- Set fillchars
opt.fillchars = {
	diff      = '╱',
	eob       = ' ', -- ~
	fold      = ' ',
	foldclose = '',
	foldopen  = '',
	foldsep   = ' ',
	msgsep    = '─',
	horiz     = '─', -- -
	vert      = '│'
}

-- lua/neovide.lua
if g.neovide then
	-- Font
	o.guifont = "0xProto Nerd Font:h12"  -- adjust size as needed

	-- Hide mouse when typing
	g.neovide_hide_mouse_when_typing = true

	-- padding
	g.neovide_padding_top    = 20
	g.neovide_padding_bottom = 20
	g.neovide_padding_right  = 20
	g.neovide_padding_left   = 20
end

-- use Neovim nightly branch
-- vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:'

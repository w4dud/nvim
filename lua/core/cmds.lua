-- ========================================
-- === AUTOCMDS / AUTO COMMANDS ===========
-- ========================================
--  See `:help lua-guide-autocommands`

local autocmd = vim.api.nvim_create_autocmd

-- -----------------------------
-- [[ Basic Autocommands ]]
-- -----------------------------

-- Highlight text when yanking (copying)
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Restore cursor to last known position when opening a file
autocmd('BufReadPost', {
	desc = 'Restore cursor to last known position when opening a file',
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			vim.api.nvim_win_set_cursor(0, mark)
		end
	end,
})

-- -----------------------------
-- [[ Filetype-specific settings ]]
-- -----------------------------

-- HTML / CSS indentation
autocmd('FileType', {
	pattern = { 'html', 'css' },
	desc = 'Set indentation for HTML/CSS',
	callback = function()
		vim.opt_local.shiftwidth  = 2
		vim.opt_local.tabstop     = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab   = true
	end,
})

-- Lisp listchars
autocmd('FileType', {
	pattern = { 'lisp' },
	desc = 'Enable list mode for Lisp',
	callback = function()
		vim.opt_local.list = true
	end,
})

-- C / Beancount: disable expandtab (use real tabs)
autocmd('FileType', {
	pattern = { 'c', 'beancount' },
	desc = 'Disable expandtab for C/Beancount',
	callback = function()
		vim.opt_local.expandtab = false
	end,
})

-- C / C++: 42 header management (FIX / TODO)
autocmd({ 'BufNewFile', 'FileType', 'BufLeave' }, {
	desc = 'Add or update 42 header on C/C++ files',
	pattern = { 'c', 'cpp' },
	callback = function()
		if vim.opt_local.modified then
			vim.cmd[[Stdheader]]
		end
	end,
})

-- -----------------------------
-- [[ Copilot Blink Events ]]
-- -----------------------------

autocmd("User", {
	pattern = "BlinkCmpMenuOpen",
	callback = function()
		vim.b.copilot_suggestion_hidden = true
	end,
})

autocmd("User", {
	pattern = "BlinkCmpMenuClose",
	callback = function()
		vim.b.copilot_suggestion_hidden = false
	end,
})

-- -----------------------------
-- [[ Run TodoTrouble on first buffer ]]
-- -----------------------------

--[[ autocmd({ "BufReadPost", "BufNewFile" }, {
	desc = "Run TodoTrouble whenever a file or buffer is opened",
	callback = function()
		vim.cmd("TodoTrouble")
	end,
}) ]]

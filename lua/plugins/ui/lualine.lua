-- For a custumized statuline, there's some stuff that are hided from lualine checks.
-- their repository on github to change them if you want.

return {
	'nvim-lualine/lualine.nvim',
	enabled = true,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'dokwork/lualine-ex',
		'archibate/lualine-time',
	},
	config = function()
		local lualine = require 'lualine'
		local lazy_status = require 'lazy.status' -- to configure lazy pending updates count

		-- configure lualine with modified theme
		lualine.setup {
			-- If you wanna disable it.
			options = {
				disabled_filetypes = {
					-- 'c', -- If you wanna hide it in C files.
					'neo-tree',
					'toggleterm',
					'alpha',
					'aerial',
					'Outline',
					'qf',
					'sagaoutline',
					'dapui_scopes',
					'dapui_breakpoints',
					'dapui_stacks',
					'dapui_watches',
					'dapui_console',
					'dap-repl',
                    'oil',
                    'trouble'
				},
				-- section_separators = { left = '', right = '' },
				-- component_separators = { left = '', right = '' },
				-- section_separators = { left = '', right = '' },
				-- component_separators = { left = "", right = "" },
				theme = 'auto',
                globalstatus = true,
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
			},
			sections = {

				lualine_a = {
					-- { "mode", separator = { left = "", right = "" }, right_padding = 2 },
				},
				lualine_b = {
					-- { 'mode' },
					{ 'ex.cwd' },
					{ 'branch' },
					-- { "filename" },
					-- { "filetype" },
					-- { "diagnostics" },
					-- { "GetCurrentDiagnosticString()" },
					-- "filetype",
				},
				lualine_c = {
					--[[ {
						function()
							return require('lspsaga.symbol.winbar').get_bar()
						end,
					}, ]]
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
					},
					-- { "encoding" },
					-- { "fileformat" },
					-- { "filetype" },
					-- "branch",
				},
				lualine_y = {
					-- Date
					{
						function()
							local ok, pomo = pcall(require, 'pomo')
							if not ok then
								return ''
							end

							local timer = pomo.get_first_to_finish()
							if timer == nil then
								return ''
							end

							return '󰄉 ' .. tostring(timer)
						end,
					},
					{ 'ex.lsp.single' },
					-- { 'ex.lsp.null_ls' },
					{
						'ex.progress',

						-- How to show the progress. It may be the one of two string constants:
						-- 'percent' or 'bar'. In the 'percent' mode the progress is shown as percent of the file.
						-- In the 'bar' mode it's shown as the vertical bar. Also, it can be a table with symbols
						-- which will be taken to show according to the progress, or a function, which receive three
						-- arguments: the component itself, the cursor line and total lines count in the file.
						mode = 'bar',

						-- This string will be shown when the cursor is on the first line of the file. Set `false`
						-- to turn this logic off.
						top = 'Top',

						-- This string will be shown when the cursor is on the last line of the file. Set `false`
						-- to turn this logic off.
						bottom = 'Bot',
					},
					{ 'ex.spellcheck' },
					-- { 'fileformat' },
				},

				lualine_z = {},
			},
		}
	end,
}

return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'dokwork/lualine-ex',
        'archibate/lualine-time',
    },
    config = function()
        local lualine = require('lualine')
        local lazy_status = require('lazy.status')

        -- =====================
        -- Gruvbox Soft colors
        -- =====================
        local colors = {
            none = "NONE",
            bg0 = "#32302f",
            bg1 = "#3c3836",
            bg2 = "#504945",
            fg  = "#d4be98",

            red     = "#ea6962",
            green   = "#a9b665",
            yellow  = "#d8a657",
            orange  = "#e78a4e",
            blue    = "#7daea3",
            magenta = "#d3869b",
            cyan    = "#89b482",

            gray0 = "#a89984",
            gray1 = "#665c54",
            gray2 = "#928374",
        }

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
        }

        local config = {
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
                globalstatus = true,
                component_separators = '',
                section_separators = { left = '', right = '' },
                theme = {
                    normal   = { c = { fg = colors.fg, bg = colors.bg0 } },
                    inactive = { c = { fg = colors.gray0, bg = colors.bg0 } },
                },
            },
            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        }

        local function ins_left(c)
            table.insert(config.sections.lualine_c, c)
        end

        local function ins_right(c)
            table.insert(config.sections.lualine_x, c)
        end

        -- =====================
        -- Left
        -- =====================
        ins_left {
            -- function() return '▊' end,
            function() return ' ' end,
            color = { fg = colors.blue },
            padding = { left = 0, right = 1 },
        }

        ins_left {
            function() return '' end,
            color = function()
                local mode_colors = {
                    n = colors.red,
                    i = colors.green,
                    v = colors.blue,
                    V = colors.blue,
                    [''] = colors.blue,
                    c = colors.magenta,
                    s = colors.orange,
                    S = colors.orange,
                    R = colors.yellow,
                    r = colors.cyan,
                    t = colors.red,
                }
                return { fg = mode_colors[vim.fn.mode()] }
            end,
            padding = { right = 1 },
        }

        ins_left { 'filesize', cond = conditions.buffer_not_empty }

        ins_left {
            'filename',
            cond = conditions.buffer_not_empty,
            color = { fg = colors.magenta, gui = 'bold' },
        }

        ins_left { 'location', color = { fg = colors.gray0 } }

        ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

        ins_left {
            'diagnostics',
            symbols = { error = ' ', warn = ' ', info = ' ' },
            diagnostics_color = {
                error = { fg = colors.red },
                warn  = { fg = colors.yellow },
                info  = { fg = colors.cyan },
            },
        }

        ins_left { function() return '%=' end }

        ins_left {
            function()
                local ft = vim.bo.filetype
                for _, client in ipairs(vim.lsp.get_clients()) do
                    if client.config.filetypes
                        and vim.tbl_contains(client.config.filetypes, ft)
                    then
                        return client.name
                    end
                end
                return 'No LSP'
            end,
            icon = ' LSP:',
            color = { fg = colors.fg, gui = 'bold' },
        }

        -- =====================
        -- Right
        -- =====================
        ins_right {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.orange },
        }

        ins_right {
            'branch',
            icon = '',
            color = { fg = colors.magenta, gui = 'bold' },
        }

        ins_right {
            'diff',
            cond = conditions.hide_in_width,
            symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
            diff_color = {
                added    = { fg = colors.green },
                modified = { fg = colors.orange },
                removed  = { fg = colors.red },
            },
        }

        ins_right {
            -- function() return '▊' end,
            function() return ' ' end,
            color = { fg = colors.blue },
            padding = { left = 1 },
        }

        lualine.setup(config)
    end,
}

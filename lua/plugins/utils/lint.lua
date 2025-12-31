return {}
--[[ return {
    -- 1. The Linter Plugin
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")

            -- 2. Configure linters per filetype
            lint.linters_by_ft = {
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
                javascriptreact = { "eslint_d" },
                typescriptreact = { "eslint_d" },
                python = { "pylint" },
                sh = { "shellcheck" },
                -- Use the "*" filetype to run linters on all filetypes.
                -- ['*'] = { 'global linter' },
                -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
                -- ['_'] = { 'fallback linter' },
                -- ["*"] = { "codespell" },
            }

            -- 3. Create an autocommand to trigger linting
            -- You can trigger on specific events like writing the buffer
            local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },
    
    -- 4. (Optional) Mason to manage the external tools
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    }
} ]]

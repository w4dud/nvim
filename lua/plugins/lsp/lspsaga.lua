return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup {
            symbol_in_winbar = {
                enable = false,   -- disables breadcrumb symbols
            },
            -- NOTE: Disable symbols bar.
        }
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons', -- optional
    },
}

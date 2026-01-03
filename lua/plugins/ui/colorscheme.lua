return {
    {
        "dybdeskarphet/gruvbox-minimal.nvim",
        "folke/tokyonight.nvim",
        "rebelot/kanagawa.nvim",
    },
    { "catppuccin/nvim", name = "catppuccin" },
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
    {
        'sainnhe/gruvbox-material',
        config = function()
            vim.cmd [[let g:gruvbox_material_background = 'soft']]
            vim.cmd [[colorscheme gruvbox-material]]
        end,
    }
}

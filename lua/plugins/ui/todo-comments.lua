return {
	'folke/todo-comments.nvim',
	enabled = true,
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
        keywords = {
            TEST = {icon = "󰙨"}, -- icons: 󰙨 󰤑
            QUESTION = {
                icon = " ",
                color = "hint",
                alt = { "Q", "QUESTION", "WHY", "HOW" },
            },
        }

    },
}

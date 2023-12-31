return {
	-- Highlight, edit, and navigate code
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
		{
			"windwp/nvim-ts-autotag",
			config = function()
				require("nvim-ts-autotag").setup()
			end,

		},
		{
			"nvim-treesitter/nvim-treesitter-context",
			dependencies = { "nvim-treesitter/nvim-treesitter" },
			config = function()
				require("treesitter-context").setup({ enable = true })
			end,
		},

		{
			"Wansmer/treesj",
			keys = {
				{ "<leader>J", "<cmd>TSJSplit<CR>", desc = "Treesj split" },
				{ "<leader>j", "<cmd>TSJJoin<CR>",  desc = "Treesj join" },
			},

			config = function()
				require("treesj").setup()
			end,
		},
	},
	build = ':TSUpdate',

}

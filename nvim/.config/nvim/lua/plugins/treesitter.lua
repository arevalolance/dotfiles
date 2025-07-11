return {
	-- Highlight, edit, and navigate code
	'nvim-treesitter/nvim-treesitter',
	enabled = not vim.g.vscode,
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
		{
			"windwp/nvim-ts-autotag",
			config = function()
				require("nvim-ts-autotag").setup({
					enable = true,
					filetypes = {
						"html",
						"javascript",
						"javascriptreact",
						"jsx",
						"markdown",
						"tsx",
						"typescript",
						"typescriptreact",
						"prisma",
						"vue",
						"astro",
						"terraform"
					},

				})
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
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"dockerfile",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"markdown",
				"prisma",
				"python",
				"sql",
				"tsx",
				"typescript",
				"yaml",
				"astro",
				"vue",
				"terraform"
			},
			highlight = { enable = true, additional_vim_regex_highlighting = false },
		})
	end,
}

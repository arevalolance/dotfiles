return {
	-- Add indentation guides even on blank lines
	'lukas-reineke/indent-blankline.nvim',
	cond = function()
		return vim.g.vscode == nil
	end,

	-- Enable `lukas-reineke/indent-blankline.nvim`
	-- See `:help ibl`
	main = 'ibl',
	opts = {},
}

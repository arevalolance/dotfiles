return {
	"nyoom-engineering/oxocarbon.nvim",
	-- Add in any other configuration;
	--   event = foo,
	--   config = bar
	--   end,
	config = function()
		vim.opt.background = "dark" -- set this to dark or light
		vim.cmd("colorscheme oxocarbon")

		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	end
}

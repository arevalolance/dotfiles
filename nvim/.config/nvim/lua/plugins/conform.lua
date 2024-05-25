return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
		})

		local format = function()
			local ft = vim.bo.ft
			local js_fts = {
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
			}

			for _, v in ipairs(js_fts) do
				if ft == v then
					vim.cmd("EslintFixAll")
					break
				end
			end

			conform.format({
				lsp_fallback = true,
				async = true,
			})
		end

		vim.keymap.set({ "n", "v" }, "<leader>p", format, { desc = "[P]rettier | Format file or range" })
	end,
}

return { 
    "stevearc/dressing.nvim", 
    event = "VeryLazy",
    cond = function()
        return vim.g.vscode == nil
    end
}

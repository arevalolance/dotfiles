return {
  {
    'tpope/vim-fugitive',
    cond = function()
      return vim.g.vscode == nil
    end
  },
  {
    'tpope/vim-rhubarb',
    cond = function()
      return vim.g.vscode == nil
    end
  },
  {
    "sindrets/diffview.nvim", -- Sweet diff helper
    cond = function()
      return vim.g.vscode == nil
    end
  }
}

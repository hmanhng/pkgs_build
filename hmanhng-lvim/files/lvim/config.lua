-- general
vim.opt.cmdheight = 1
vim.wo.relativenumber = true
vim.opt.wrap = true
vim.wo.foldmethod = "indent"
-- vim.wo.foldnestmax = 10
-- vim.wo.foldlevel = 2
vim.wo.cursorlineopt = "both"
vim.wo.linebreak = true
vim.wo.list = true
vim.wo.listchars = "tab:>-,trail:~,extends:>,precedes:<"
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true

vim.cmd('luafile ~/.config/lvim/alpha.lua')
vim.cmd('luafile ~/.config/lvim/lualine.lua')
vim.cmd('luafile ~/.config/lvim/mappings.lua')
vim.cmd('luafile ~/.config/lvim/treesitter.lua')
vim.cmd('luafile ~/.config/lvim/lsp.lua')

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "andymass/vim-matchup",
    config = function()
      vim.cmd([[
        hi MatchWord guifg=#00fff7 gui=bold
        hi MatchWordCur guifg=#00fff7 gui=bold
      ]])
    end
  },
  { "p00f/nvim-ts-rainbow" }
}

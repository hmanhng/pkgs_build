-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  "c_sharp",
  "comment",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "vim",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.rainbow = { enable = true, extended_mode = true, max_file_lines = nil }
lvim.builtin.treesitter.matchup.enable = true
--------------------------------------------------------------------------------

-- lualine
lvim.builtin.lualine.style = "lvim"
local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.options = {
  component_separators = { left = '', right = '' },
  -- section_separators = { left = '', right = '' }
}
lvim.builtin.lualine.sections = {
  lualine_a = {
    components.mode,
  },
  lualine_b = {
    components.filename,
    components.branch,
  },
  lualine_c = {
    components.diff,
    components.python_env,
  },
  lualine_x = {
    components.diagnostics,
    components.treesitter,
    components.lsp,
    components.filetype,
  },
  lualine_y = {
    components.spaces

  },
  lualine_z = {
    components.location,
    components.scrollbar,
  },
}
----------------------------------------------------------------------------------

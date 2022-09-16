-- Alpha
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "startify"
lvim.builtin.alpha.startify.section = {
  header = {
    val = {
      [[ __                                   __                          ]],
      [[/\ \                                 /\ \                         ]],
      [[\ \ \___     ___ ___      __      ___\ \ \___     ___      __     ]],
      [[ \ \  _ `\ /' __` __`\  /'__`\  /' _ `\ \  _ `\ /' _ `\  /'_ `\   ]],
      [[  \ \ \ \ \/\ \/\ \/\ \/\ \L\.\_/\ \/\ \ \ \ \ \/\ \/\ \/\ \L\ \  ]],
      [[   \ \_\ \_\ \_\ \_\ \_\ \__/.\_\ \_\ \_\ \_\ \_\ \_\ \_\ \____ \ ]],
      [[    \/_/\/_/\/_/\/_/\/_/\/__/\/_/\/_/\/_/\/_/\/_/\/_/\/_/\/___L\ \]],
      [[                                                           /\____/]],
      [[                                                           \_/__/ ]],
    },
    opts = {
      position = "center",
      hl = "Operator",
    },
  },
  top_buttons = {
    entries = {
      { "f", "  Find File", "<CMD>Telescope find_files<CR>" },
      { "n", "  New File", "<CMD>ene!<CR>" },
      { "P", "  Recent Projects ", "<CMD>Telescope projects<CR>" },
      { "r", "  Recently Used Files", "<CMD>Telescope oldfiles<CR>" },
      { "t", "  Find Word", "<CMD>Telescope live_grep<CR>" },
      { "c", "  Configuration", "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>", },
    },
    opts = {
      spacing = 1,
    },
  },
  bottom_buttons = {
    entries = {
      { "q", " Quit", "<CMD>quit<CR>" },
    },
  },
}
local startify = require 'alpha.themes.startify'
startify.section.mru.val = { { type = "padding", val = 0 } }
startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
-------------------------------------------------------------------------

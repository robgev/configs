-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "configs.highlights"

M.nvdash = {
  load_on_startup = true,

  header = {
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⡋⡍⠛⠛⡛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡯⠁⢀⠄⠀⠂⠙⢦⠐⠖⠁⢤⡙⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⣰⠡⠆⠀⠉  ⠠⠆⠀⠀⢿⠸⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠼⠃⠄⠔⢁⢀⣶⣦⣄⣀⣀⡀⠘⢠⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠔⣁⣾⣿⣿⡼⣿⣿⣿⠀⢸⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⣼⣿⡀⠀⠀⠀⣻⡙⠛⢀⣼⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⣀⠁⠀⣿⡿⣿⣶⣶⠀⢻⣄⢀⣼⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠰⠌⠁⠹⠟⠁⢀⠀⣿⢇⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⢀⠀⣈⠐⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⠿⠟⠛⠛⠋⠉⠉⠙⠁⠀⣿⣆⠀⠀⢀⠀⡾⣿⡄⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⡿⠋⠁⠀⠀⠀⠀⠀⠀⠒⠀⠀⠀⠀⠀⣠⣶⣦⠀⣿⣿⡇⠀⢀⡀⠑⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⠟⠀⢀⣴⡗⠀⣠⣴⣶⣶⣶⣤⣄⡀⠀⠀⢻⣿⣿⡄⣿⣿⡇⢠⣿⣿⣿⣿⣶⣶⣝⠻⣿⣿⣿⣿⣿⣿⣿⣿",
    "⡏⠀⣴⣿⣿⠁⢸⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⠀⢽⣿⡧⠘⠟⢠⣿⣿⠛⡩⠋⣽⣿⣿⣷⣌⢿⣿⣿⣿⣿⣿⣿",
    "⠁⠸⣿⣿⣿⡇⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠈⠛⠃⠀⠀⠾⠋⠀⠋⣁⣼⣭⣽⡻⢿⣿⣧⣻⢿⣿⣿⣿⣿",
    "⣷⡀⢹⣿⣿⣿⣧⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣦⡙⢿⣿⣷⣌⢿⣿⣿",
    "⣿⣷⠀⣿⣿⡏⠁⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠀⢰⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⢹⣿⣿⣧⠻⣿",
    "⣿⠟⢠⣾⠏⠀⢠⢓⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣇⢻",
    "⢡⣴⣿⠟⢀⡀⠹⡞⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⢸",
    "⠺⠟⢁⣴⣿⣿⡄⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⠏⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⡿⣿⣿⢰⣿⣿⣿⢇⣿",
    "⣤⣶⣿⣿⣿⣿⣿⣄⠀⠀⠈⠻⠿⣿⣿⡿⠃⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢋⡴⠉⢀⣿⣿⣮⡙⣿⣿⢸⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⢏⡴⠏⠀⡀⢸⣿⣿⣿⣿⡜⣿⣧⢻",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⡈⠛⠀⣀⣠⣤⡀⠀⣀⣀⡀⠀⠈⠉⠛⠿⠃⠋⢡⡄⢰⣇⠸⣿⣿⣿⣿⡿⢸⣿⡌",
    "⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⢻⠀⠘⠛⠛⠛⠇⠠⠿⢿⣿⣿⣆⠀⣶⡶⢊⣴⠟⡃⢸⣿⡀⢻⣿⣿⡿⢱⣿⣿⢡",
    "⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢶⠀⣾⣿⣿⣿⡆⠀⣶⣤⣤⣭⣤⡄⢿⡷⢛⡵⢸⣷⡀⠉⣡⡈⢿⣿⡁⣿⣿⣷⢻",
    "⣿⣿⣿⣿⣿⣿⣿⡿⠁⢰⣌⠀⠉⠙⠛⣉⡁⢀⣍⣙⣛⣛⣛⡁⢾⡷⣫⡶⣸⣿⣷⡀⠈⡃⠀⢹⣿⡜⣿⣿⠇",
    "                   CHAD                  ",
    "                  NEOVIM                 ",
  },
}

M.base46 = {
  theme = "nightfox",
  theme_toggle = { "nightfox", "one_light" },
}

M.ui = {
  hl_override = highlights.override,
  hl_add = highlights.add,
}

return M

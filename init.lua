require("config.lazy")

-- Load custom config and keymaps.
require("config.customize")
require("config.remap")

-- Disable netrw.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

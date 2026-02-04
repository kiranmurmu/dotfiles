-- Exit if vscode integration
if vim.g.vscode then
    return
end
-- Load lua modules
require("config.options")
require("config.terminal")
require("config.lazy")
require("config.keymaps")

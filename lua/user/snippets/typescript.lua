local js = require("user.snippets.javascript")
local utils = require("user.snippets.utils")
local status_ok, ls = pcall(require, "luasnip")

local M = {}

local snippets = utils.merge(js.snippets)

M.setup = function()
    ls.add_snippets(null,{
        typescript = snippets,
        typescriptreact = snippets
    })
end

return M

-- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua
local ls = require"luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

ls.config.set_config({history=true,enable_autosnippets=true})


return {
s( "hi", { t("Hello, Forld!") }),
} -- end return



local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local M = {}
-- Some functions
M.math = function()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

M.nomath = function()
    return not math()
end

M.hasit = function(table,value)
    local lt = {}
    for k,v in ipairs(table) do
        lt[v] = true
    end
    return lt[value]
end

local greek_let = {"sin","cos","tan","csc","cot","sec","phi","psi","eta","chi"}

M.greekp = function(rv)
    if hasit(greek_let,rv) then rv = "\\"..rv end
    return rv
end

M.greekf = function()
    return f(function(_,snip)
        -- return greekp(snip.captures[1]).."{"..greekp(snip.captures[2]).."}"
        return greekp(snip.captures[1])..greekp(snip.captures[2])
    end)
end

M.env = function(name)
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end

-- Basically a function node with (s)nippet (c)apture and text appended
M.sc = function(n,append_text)
    append_text = append_text or ""
    return f(function(_,snip) return snip.captures[n]..append_text end)
end

-- (m)ath mode (s)nippets
M.ms = function(p1,p2)
    return s(p1,{t(p2)},{condition=M.math})
end

-- (m)ath mode (i)n word (s)nippets
M.mis = function(p1,p2)
    return M.ms({trig=p1,wordTrig=false},p2) -- wordTrig false makes inword snippet
end

-- (m)ath mode (f)ormatted (s)nippet
M.mfs = function(a,b,c)
    return s(a,fmta(b,c),{condition=M.math})
end

M.fs = function(a,b,c)
    return s(a,fmta(b,c))
end

-- (m)ath mode (i)n word (f)ormatted (s)nippet
M.mifs = function(a,b,c)
    return M.mfs({trig=a,wordTrig=false},b,c)
end

-- (m)ath mode (f)ormatted (r)egex (s)nippet
M.mfrs = function(a,b,c)
    return M.mfs({trig=a,regTrig=true},b,c)
end

-- (t)ext mode (f)ormatted (s)nippet
M.tfs = function(a,b,c)
    return s(a,fmta(b,c),{condition = M.nomath})
end

-- (t)ext mode (f)ormatted (r)egex (s)nippet
M.tfrs = function(a,b,c)
    return M.tfs({trig=a,regTrig=true},b,c)
end

M.test = function()
    return "Here is a mest";
end

return M


local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

local M = {}

-- latex codes
local lmap = {
  ["0"] = "₀", ["1"] = "₁", ["2"] = "₂", ["3"] = "₃",
  ["4"] = "₄", ["5"] = "₅", ["6"] = "₆", ["7"] = "₇",
  ["8"] = "₈", ["9"] = "₉", ["i"] = "ᵢ", ["j"] = "ⱼ"
}

function M.scl(n)
    return f(function(_,snip)
        return lmap[snip.captures[n]]
    end)
end



-- Some functions
local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

local function nomath()
    return not math()
end

local function hasit(table,value)
    local lt = {}
    for k,v in ipairs(table) do
        lt[v] = true
    end
    return lt[value]
end

local greek_let = {"sin","cos","tan","csc","cot","sec","phi","psi","eta","chi"}

local function greekp(rv)
    if hasit(greek_let,rv) then rv = "\\"..rv end
    return rv
end

local function greekf()
    return f(function(_,snip)
        -- return greekp(snip.captures[1]).."{"..greekp(snip.captures[2]).."}"
        return greekp(snip.captures[1])..greekp(snip.captures[2])
    end)
end

local function env(name)
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end

-- Basically a function node with (s)nippet (c)apture and text appended
function M.sc(n,append_text)
    append_text = append_text or ""
    return f(function(_,snip) return snip.captures[n]..append_text end)
end

-- (m)ath mode (s)nippets
local function ms(p1,p2)
    return s(p1,{t(p2)},{condition=math})
end

-- (m)ath mode (i)n word (s)nippets
local function mis(p1,p2)
    return ms({trig=p1,wordTrig=false},p2) -- wordTrig false makes inword snippet
end

-- (m)ath mode (f)ormatted (s)nippet
local function mfs(a,b,c)
    return s(a,fmta(b,c),{condition=math})
end

-- (m)ath mode (i)n word (f)ormatted (s)nippet
local function mifs(a,b,c)
    return mfs({trig=a,wordTrig=false},b,c)
end

-- (m)ath mode (f)ormatted (r)egex (s)nippet
local function mfrs(a,b,c)
    return mfs({trig=a,regTrig=true},b,c)
end

-- (t)ext mode (f)ormatted (s)nippet
local function tfs(a,b,c)
    return s(a,fmta(b,c),{condition = nomath})
end

-- (t)ext mode (f)ormatted (r)egex (s)nippet
local function tfrs(a,b,c)
    return tfs({trig=a,regTrig=true},b,c)
end

-- (t)ext mode (i)n word (s) snippet
local function tis(a,b)
    return s({trig=a,wordTrig=false},{t(b)})
end

-- snippet begin

local function test(apple)
  return "mest "..apple
end



-- function getall()
--     for k,v in pairs(rvs) do
--         if _G[k] then
--             io.stderr:write("use: skipping duplicate symbol ", k, "\n")
--         else
--             _G[k] = v
--         end
--     end
-- end

return M

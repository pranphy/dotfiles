-- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua
local ls = require"luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

ls.config.set_config({history=true,enable_autosnippets=true})

-- Some functions
local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end 

local function nomath()
    return not math()
end 

local function env(name) 
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end

local get_date =function() return os.date("%Y-%m-%d %H:%M") end

-- Basically a function node with (s)nippet (c)apture and text appended
local function sc(n,append_text)
    append_text = append_text or ""
    return f(function(_,snip) return snip.captures[n]..append_text end)
end

-- (m)ath mode (s)nippets
local function ms(p1,p2)
    return s(p1,{t(p2)},{condition=math})
end

-- (m)ath mode (f)ormatted (s)nippet
local function mfs(a,b,c)
    return s(a,fmta(b,c),{condition=math})
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

-- dynamic matrix 
local mat = function(args, snip)
	local rows = tonumber(snip.captures[2])
    local cols = tonumber(snip.captures[3])
	local nodes = {}
	local ins_indx = 1
	for j = 1, rows do
		table.insert(nodes, r(ins_indx, tostring(j).."x1", i(1)))
		ins_indx = ins_indx+1
		for k = 2, cols do
			table.insert(nodes, t" & ")
			table.insert(nodes, r(ins_indx, tostring(j).."x"..tostring(k), i(1)))
			ins_indx = ins_indx+1
		end
		table.insert(nodes, t{"\\\\", ""})
	end
	return sn(nil, nodes)
end


-- Actual snippets beg
return {

s( "hi", { t("Hello, Forld!") }),
s({trig="head", snippetType="autosnippet"},
   fmta([[
        % Author : Prakash
        % Date   : <>
        % vim: ai ts=4 sts=4 et sw=4 ft=tex
        <>
       ]],
       { f(get_date), i(0) }
   )
),

tfs({trig="fig"},
    [[
    \begin{figure}[<>]
        \centering
        \includegraphics[width=<>\linewidth]{<>}
        \caption{<>}
        \label{fig:<>}
    \end{figure}
    ]],
    {
        i(1,"htpb"),
        i(2,"0.8"),
        i(3,"images/example.jpg"),
        i(4,"Some cool caption"),
        i(5,"fig-label")
    }
),




-- full snippet
s({ trig="([bBpvV])mat(%d+)x(%d+)([ar])", regTrig=true, name="matrix", dscr='matrix trigger lets go'},
    fmta([[
    \begin{<>}<>
    <>
    \end{<>}]],
    {sc(1,"matrix"),
    f(function (_, snip) -- augments
        if snip.captures[4] == "a" then
            out = string.rep("c", tonumber(snip.captures[3]) - 1)
            return "[" .. out .. "|c]"
        end
        return ""
    end),
    d(1, mat),
    sc(1,"matrix")}
    )
),



},  

{-- auto trigger begin

ms("int ","\\int" ), --auto correct integration
ms("oo","\\infty" ), --auto correct infinity
ms("DD","\\Delta" ), --auto correct infinity
ms("inff", [[\int\limits_{-\infty}^{\infty}]]),
ms("inof", [[\int\limits_{0}^{\infty}]]),
ms("info", [[\int\limits_{-\infty}^{0}]]),
ms("inop", [[\int\limits_{0}^{\pi}]]),
ms("inpp", [[\int\limits_{-\pi}^{\pi}]]),

-- glossary entry
tfrs("gls(%w+)%s", [[\gls{<>} ]],{sc(1)}),
tfrs("pgls(%w+)%s", [[\glspl{<>} ]],{sc(1)}),

-- 
tfrs("(%w+)", [[\textbf{<>}]],{sc(1)}),

tfrs(";(%w+)", "$<>$",{sc(1)}),
tfrs(";;", "$<>$",{i(1)}),


-- Math mode
tfs("alins",
  [[
  \begin{align*}
      <>
  \end{align*}
  ]], { i(1) } 
),



-- subscripts
mfrs('(%a)(%d)', [[<>_<>]], {sc(1), sc(2)} ),
mfrs('(%a)_(%d%d)', [[<>_{<>}]], { sc(1),sc(2) }),


-- scientific notation
mfrs('(%d+)[Ee](-?)(%d+)%s',
    [[<> \times 10^{<><>}]],
    { sc(1), sc(2), sc(3) }
),

-- scientific notation text mode
tfrs('(%d+)[Ee](-?)(%d+)%s',
    [[$<> \times 10^{<><>}$]],
    { sc(1), sc(2), sc(3) }
),

mfs("//", [[\frac{<>}{<>} ]], {i(1),i(2)} ),
mfs("((", [[\left( <> \right) ]], {i(1)} ),
mfs("[[", [[\left[ <> \right] ]], {i(1)} ),
mfs("{{", [[\left{ <> \right} ]], {i(1)} ),

-- cases
mfs("cases",
    [[
    \begin{cases}
        <> & \text{if } <> \\
        <> &  <> \\
    \end{cases}
    ]],
    { i(1), i(2,"x \\leq 0"), i(3), i(4,"\\text{otherwise}") }
),

-- General fraction
mfrs('([\\%w%(%)_^,}{+-=]+)%/',
    [[\frac{<>}{<>}]],{sc(1),i(1)}
),

}

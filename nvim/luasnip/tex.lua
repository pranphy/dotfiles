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
    return function()
        local is_inside = vim.fn['vimtex#env#is_inside'](name)
        return (is_inside[1] > 0 and is_inside[2] > 0)
    end
end

-- Basically a function node with (s)nippet (c)apture and text appended
local function sc(n,append_text)
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
       { t(os.date("%Y-%m-%d %H:%M")), i(0) }
   )
),
s({trig="tmpl", snippetType="autosnippet"},
   fmta([[
        \documentclass[a4paper,11pt]{article}
        \usepackage{amsmath}
        \usepackage{parskip}
        \title{Test Title}
        \date{<>}
        \begin{document}
            <>
        \end{document}
       ]],
       { t(os.date("%Y-%m-%d")), i(0) }
   )
),


tfs({trig="beg"},
    [[
    \begin{<>}
        <>
    \end{<>}
    ]], { i(1,"env"), i(2), rep(1) }
),


tfs({trig="minted"},
    [[
    \begin{minted}[autogobble]{cpp}
        <>
    \end{minted}
    ]], { i(1,"code")}
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
        i(3,"example-image-a"),
        i(4,"Some cool caption"),
        i(5,"fig-label")
    }
),

tfs({trig="twocols"},
    [[
        \begin{columns}
            \begin{column}{0.5\textwidth}
               <>
            \end{column}
            \begin{column}{0.5\textwidth}
                ome text
            \end{column}
        \end{columns}
    ]], { i(1,"some text here")}
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
s("sec",fmta([[\section{<>}]],{i(0,"Section Title")})),

tfs("--",
  [[
  \begin{itemize}
      \item  <>
  \end{itemize}
  ]], { i(1) }
),

-- Non auto trigger end
},

{-- auto trigger begin
s("pac",fmta([[\usepackage{<>}]],{i(0,"package")})),
s("igfx",fmta([[\includegraphics[width=<>\linewidth]{<>}]],{i(0,"0.9"),i(1,"./asset/image/")})),

ms("int ","\\int " ), --auto correct integration
ms("oo","\\infty " ), --auto correct infinity
ms("DD","\\Delta " ), --auto correct infinity
ms("inff", [[\int\limits_{-\infty}^{\infty}]]),
ms("inof", [[\int\limits_{0}^{\infty}]]),
ms("info", [[\int\limits_{-\infty}^{0}]]),
ms("inop", [[\int\limits_{0}^{\pi}]]),
ms("inpp", [[\int\limits_{-\pi}^{\pi}]]),

mis("sr","^2" ), --auto correct integration
mifs("^^",[[^{<>}]],{i(1)}), --auto correct integration
--ms("sr ", [[^{2}]]),--{i(1)}),
mifs("td(%d+)%s", [[^{<>}]],{sc(1)}),

-- Greek Process
mfrs("(%w%w%w)(%w%w%w)", [[<>]],{greekf()}),

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



-- beamer
tfs("sloc",
  [[
  \begin{frame}{<>}
      <>
  \end{frame}
  ]], { i(1),i(2) }
),



-- subscripts
-- mfrs('(%l)(%d)', [[<>_<>]], {sc(1), sc(2)} ),
--mfrs('(%a)_(%d%d)', [[<>_{<>}]], { sc(1),sc(2) }),

mfrs("<([%w\\]+)|",[[\bra{<>}]], {sc(1)}),
mfrs("\\bra{([\\%w%d]+)}([\\%w%d]+)>",[[\ip{<>}{<>}]], {sc(1),sc(2)}),
mfrs("\\ip{([\\%w%d]+)}{([\\%w%d]+)}sq",[[\norm{\ip{<>}{<>}}^{2}]], {sc(1),sc(2)}),
mfrs("`([%w_]+)`",[[\icode{<>}]], {sc(1)}),

-- scientific notation
mfrs('(%d+)[Ee](-?)(%d+)%s',
    [[<> \times 90^{<><>}]],
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

-- s(p1,{t(p2)},{condition=math})
s("-",fmta([[\entry[<>] ]],{f(function() return os.date("%H:%M") end)}),{condition=env("updates")}),
s("now",fmta([[<>]],{f(function() return os.date("%Y-%m-%d") end)}),{condition=env("updates")}),

}


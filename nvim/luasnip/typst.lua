-- Some functions

local function count_delim(line)
  local _, count = string.gsub(line, "%$", "")
  return count
end

local function math()
    local all_text = vim.api.nvim_buf_get_lines(0,0,-1,false)
    local row,col =  unpack(vim.api.nvim_win_get_cursor(0))
    local dcc = 0
    for i,line in ipairs(all_text) do
      if i < row then dcc = dcc+ count_delim(line)
      elseif i == row then dcc = dcc + count_delim( string.sub(line,0,col) )
      else break end
    end
    return dcc % 2 == 1
end

local function nomath()
    return  not math()
end

local function mathe()
    local all_text = vim.api.nvim_buf_get_lines(0,0,-1,false)
    local row,col =  unpack(vim.api.nvim_win_get_cursor(0))

    local dcc = 0
    local dc = ""
    local crd = ""

    for i,line in ipairs(all_text) do
      if i < row then
        local _, count = string.gsub(line, "%$", "")
          dc = dc..", "..i..": "..count
          dcc = dcc+count
      elseif i == row then
        crd = string.sub(line,1,col)
      end
    end
    inmath = "no"
    if dcc % 2 == 1 then
      inmath = "yes"
    end
    --return dcc.."> Rem "..inmath
    return "("..row..","..col..") -> dc:"..dcc.." inmath: <<"..inmath..">> crd|"..crd.."|"
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
    if hasit(greek_let,rv) then rv = " "..rv end
    return rv
end

local function greekf()
    return f(function(_,snip)
        -- return greekp(snip.captures[1]).."{"..greekp(snip.captures[2]).."}"
        return greekp(snip.captures[1])..greekp(snip.captures[2])
    end)
end

local function env(name)
  return true
end


local function jc(n,append_text)
  return f(function(_,snip) return append_text..mathe() end)
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

-- (m)ath mode (i)n word (s)nippets
local function is(p1,p2)
    return s({trig=p1,wordTrig=false},{t(p2)}) -- wordTrig false makes inword snippet
end

-- Actual snippets beg
return {

s({trig="head", snippetType="autosnippet"},
   fmta([[
        // Author : Prakash
        // Date   : <>
        // vim: ai ts=4 sts=4 et sw=4 ft=tex
        <>
       ]],
       { t(os.date("%Y-%m-%d %H:%M")), i(0) }
   )
),

tfs({trig="beg"},
    [[
    \begin{<>}
        <>
    \end{<>}
    ]], { i(1,"env"), i(2), rep(1) }
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
-- Non auto trigger end
},

{-- auto trigger begin

ms("int ","integral " ), --auto correct integration
ms("DD","Delta " ), --auto correct infinity
ms("inff", [[integral_(-oo)^(oo)]]),
ms("inof", [[integral_(0)^(oo)]]),
ms("info", [[integral_(-oo)^(0)]]),
ms("inop", [[integral_(0)^(pi)]]),
ms("inpp", [[integral_(-pi)^(pi)]]),

mis("sr","^2" ),
mis("cb","^3"),
mifs("^^",[[^(<>)]],{i(1)}),

mfs("td ", [[^(<>)]],{i(1)}),
mis("to","arrow"),
mis("pst","^*"),
mis("dgr","^dagger"),

-- Greek Process
mfrs("(%w%w%w)(%w%w%w)", [[<>]],{greekf()}),
mfrs("d(%w)", [[dif <>]],{sc(1)}),
mfrs("(%w)~", [[tilde(<>)]],{sc(1)}),
mfrs("(%w)bar", [[bar(<>)]],{sc(1)}),
mfrs("(%w)hat", [[hat(<>)]],{sc(1)}),
mfrs("vec(%w)", [[arrow(<>)]],{sc(1)}),

--
tfrs("(%w+)", [[*<>*]],{sc(1)}),

tfrs(";(%w)", "$<>$",{sc(1)}),
tfrs(";;", "$<>$",{i(1)}),



-- subscripts
mfrs('(%a)(%d)', [[<>_<>]], {sc(1), sc(2)} ),
--mfrs('(%a)_(%d%d)', [[<>_{<>}]], { sc(1),sc(2) }),


-- scientific notation
mfrs('(%d+)[Ee](-?)(%d+)%s',
    [[<> times 10^(<><>)]],
    { sc(1), sc(2), sc(3) }
),

-- scientific notation text mode
tfrs('(%d+)[Ee](-?)(%d+)%s',
    [[$<> times 10^(<><>)$]],
    { sc(1), sc(2), sc(3) }
),

mfs("//", [[frac(<>,<>) ]], {i(1),i(2)} ),

-- General fraction
mfrs('([%w%(%)_^,}{+-=]+)%/',
    [[frac(<>,<>)]],{sc(1),i(1)}
),


}

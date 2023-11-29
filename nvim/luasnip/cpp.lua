local ls = require"luasnip"

local stu = require("st.util")
--local fmtd = ls.extend_decorator.apply(fmt, {delimiters = "{}"})
-- Basically a function node with (s)nippet (c)apture and text appended
local function sc(n,append_text)
    append_text = append_text or ""
    return f(function(_,snip) return snip.captures[n]..append_text end)
end
--

return {

}, { -- End manual and start auto trigger.


s("hdr",fmt([[
    // -*- coding: utf-8 -*-
    // vim: ai ts=4 sts=4 et sw=4 ft=cpp
    // author : Prakash [प्रकाश]
    // date   : {}

]], { f(stu.date_ymd)}
)),

s( "mainfunc", fmta([[
    int main(int argc, char** argv)
    {
        <>
        return 0;
    }
    <>
    ]], {i(1),i(0)})
),

s("cout", fmt([[std::cout<<"{}"<<std::endl;]],{i(1)})),
s("rh2", fmta([[auto <> = new TH2D("<>","Title; x[mm]; y[mm]",100,0,100,100,0,100); ]],{i(1),i(2)})),


s( "fn", fmta([[
    <> <>(<>)
    {
        <>
    }
    <>
    ]], { i(1, "int"),i(2,"function_name"),i(3,"int a"), i(4,"statement;"), i(0)}
)),


s({trig="for(%w+)%s",regTrig=true}, fmta([[
    for(int <> = <>; <> <>; <>)
    {
        <>
    }
    ]], {sc(1),i(1,"0"),sc(1),i(2," < 10"), sc(1,"++"),i(3,"statements;")}
)),


}


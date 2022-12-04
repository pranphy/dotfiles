local ls = require"luasnip"
--local fmtd = ls.extend_decorator.apply(fmt, {delimiters = "{}"})
-- Basically a function node with (s)nippet (c)apture and text appended
local function sc(n,append_text)
    append_text = append_text or ""
    return f(function(_,snip) return snip.captures[n]..append_text end)
end
--

return {
s( "kymp", { t("Hello, This is python!") }),
}, { -- End manual and start auto trigger.

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


s( "fn", fmta([[
    <> <>(<>)
    {
        <>
    }
    <>
    ]], { i(1, "int"),i(2,"function_name"),i(3,"int a"), i(4,"statement;"), i(0)}
)),

s("cout", fmt([[std::cout<<"{}"<<std::endl;]],{i(1)})),

s({trig="for(%w+)%s",regTrig=true}, fmta([[
    for(<> = <>; <> <>; <>)
    {
        <>
    }
    ]], {sc(1),i(1,"0"),sc(1),i(2," < 10"), sc(1,"++"),i(3,"statements;")}
)),


}


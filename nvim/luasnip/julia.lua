local ls = require ("st.luasnip")

return {
},
{
s("alpha",{t("α")}),
s({trig="_(%d)",regTrig=true,wordTrig=false},fmt("{}",{ls.scl(1)})),
s({trig="([₀₁₂₃₄₅₆₇₈₉ᵢⱼ])(%d)",regTrig=true}, fmt("{}{}",{ls.sc(1),ls.scl(2)})),
}

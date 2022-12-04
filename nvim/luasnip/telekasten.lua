local utl = require("st.util")
return {},{
    s("tk",{t("This is tk")}),
    s("hdr",fmt([[
        ---
        title : {}
        author: Prakash
        date  : {}
        ---
    ]],{i(1,"Some title"),f(utl.date_ymd)})),

    s("vv",{t("- [ ] ")}),
}

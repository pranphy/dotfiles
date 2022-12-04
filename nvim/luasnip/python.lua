local stu = require("st.util")
return {
s( "kymp", { t("Hello, This is python!") }),
}, { -- End manual and start auto trigger.
s( "pra", { t("Hello, This is pythonista!") }),
s( "print", fmt([[print(f"{}")]], {i(1,"text")  })),
s( "fst", fmt([[f"{}"]], {i(1,"text")  })),
s("hdr",fmt([[
    #!/usr/bin/env python 
    # -*- coding: utf-8 -*-
    # vim: ai ts=4 sts=4 et sw=4 ft=python
    # author : Prakash [प्रकाश]
    # date   : {}

]], { f(stu.date_ymd)}
)),

s("mainfunc",fmt([[
    if __name__ == "__main__":
        {}
]], { i(1,"main()")}
)),

}



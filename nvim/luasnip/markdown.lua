-- ft: lua

return {},{ -- AutoTrigger
s("yhdr", fmt([[
   ---
   title: {}
   date: {}
   author: {}
   ---
   {}
   ]],
   {i(1,"Some title"), t(os.date("%Y-%m-%d %H:%M")), t("Prakash"),i(0) })
),

s("thdr", fmt([[
   +++
   title  = "{}"
   date   = "{}"
   author = "{}"
   +++
   {}
   ]],
   {i(1,"Some title"), t(os.date("%Y-%m-%d %H:%M")), t("Prakash"),i(0) })
),

s("dt",fmt("{}> ",{f(function() return os.date("%H:%M") end)})),
}

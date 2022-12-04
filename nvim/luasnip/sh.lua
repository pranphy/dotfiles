return { },
{ -- Autotrigger begin
    s("hdr",fmt([[
        #!/usr/bin/env bash
        # -*- coding: utf-8 -*-
        # vim: ai ts=4 sts=4 et sw=4 ft=sh
        # author : Prakash [प्रकाश]
        # date   : {}

    ]], { t(os.date("%Y-%m-%d %H:%M"))}
    )),

    -- TODO make it switch $() and ${}
    -- by use of choice node
    s("$",fmta("${<>}",{i(1)})),
}

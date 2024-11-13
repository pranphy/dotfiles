require("obsidian").setup({
    workspaces = {
        {
            name = "personal",
            path = "~/.Rough/vault/personal",
        },
        {
            name = "work",
            path = "~/.Rough/vault/work",
        },
        {
            name = "dimag",
            path = "~/repos/dimag",
        },
    },
    wiki_link_func = "use_alias_only"
    -- see below for full list of options 👇
})

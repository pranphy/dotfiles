require("obsidian").setup({
    workspaces = {
        {
            name = "personal",
            path = "~/scratch/vault/personal",
        },
        {
            name = "work",
            path = "~/scratch/vault/work",
        },
        {
            name = "dimag",
            path = "~/repos/dimag",
        },
    },
    ui = {
        enable = false,
    },
    --wiki_link_func = "use_alias_only"
    -- see below for full list of options 👇
})

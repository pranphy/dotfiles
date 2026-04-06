require('render-markdown').setup({
    enabled = true,
    file_types = { 'mmarkdown', 'quarto','copilot-chat' },
    render_modes = {'c','n', 't'},
    code = {
        enabled = true,
        language_icon = true,
        language = false,
        --style = 'language',
    },
    --anti_conceal = { enabled = true},
    --highlight = { enabled = true, },
    --bullet = { enabled = true,}, 
    --quote = { enabled = true, },
})

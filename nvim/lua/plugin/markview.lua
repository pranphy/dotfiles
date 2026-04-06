local presets = require("markview.presets");

require("markview").setup({
    preview = { filetypes = {'markdown', 'copilot-chat','Avante','codecompanion'}, },
    markdown = {
        headings = presets.headings.slanted
    },
    experimental = { check_rtp = false},
});

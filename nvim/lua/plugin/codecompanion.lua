local cc = require("codecompanion")
cc.setup({
    strategies = {
        chat = { adapter = "ollama" },
        inline = { adapter = "ollama" },
    },
    opts = {
        log_level = "DEBUG",
    },

    adapters = {
        ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
                schema = {
                    model = {
                        --default = "gemma3:4b",
                        --default = "qwen2.5-coder",
                        --default = "gemma3:270m",
                        default = "llama3.1:8b",
                    },
                    num_ctx = {
                        default = 16384,
                    },
                    num_predict = {
                        default = -1,
                    },
                },
                env = {
                    url = "http://127.0.0.1:11434",
                },
                headers = {
                    ["Content-Type"] = "application/json",
                    -- ["Authorization"] = "Bearer ${api_key}",
                },
                parameters = {
                    sync = true,
                },
            })
        end,
    },

})

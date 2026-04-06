local avante = require("avante")
avante.setup({
    build = "make",
    --provider = "ollama", -- gemini
    instructions_file = "AGENTS.md",
    provider = "gemini",
    providers = {
        openai = { model = "gpt-4o-mini" },
        gemini = { model = "gemini-2.5-flash" },
        ollama = {
            endpoint = "http://127.0.0.1:11434",
            --model = "deepseek-r1:latest",
            --model = "codellama:latest",
            --model = "gemma3:27b",
            --disable_tools = false,
            --model = "gemma3:4b",
            model = "gemma3:270m",
            --model = "qwen2.5-coder",
            disable_tools = true,
            --extra_request_body = { stream = true },
            is_env_set = function() return true; end,
        },
        codellama = {
            __inherited_from = "openai",
            api_key_name = "",
            endpoint = "http://localhost:11434/v1",
            model = "codellama:latest",
            max_tokens = 4096, 
            disable_tools = true, -- Open-source models often do not support tools.
            --is_env_set = function() return true; end,
        },

    }
})

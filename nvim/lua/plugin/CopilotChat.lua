require("CopilotChat").setup {
    -- See Configuration section for options
    --model = 'deepseek-r1:latest',
    --model = 'gemma3:4b',
    model = 'codellama:latest',
    sticky = {
        '#files',
        '#buffer',
    },
    providers = {
        gemini = {
            prepare_input = require('CopilotChat.config.providers').copilot.prepare_input,
            prepare_output = require('CopilotChat.config.providers').copilot.prepare_output,

            get_headers = function()
                local api_key = assert(os.getenv('GEMINI_API_KEY'), 'GEMINI_API_KEY env not set')
                return {
                    Authorization = 'Bearer ' .. api_key,
                    ['Content-Type'] = 'application/json',
                }
            end,

            get_models = function(headers)
                local response, err = require('CopilotChat.utils').curl_get('https://generativelanguage.googleapis.com/v1beta/openai/models', {
                    headers = headers,
                    json_response = true,
                })

                if err then
                    error(err)
                end

                return vim.tbl_map(function(model)
                    local id = model.id:gsub('^models/', '')
                    return {
                        id = id,
                        name = id,
                    }
                end, response.body.data)
            end,

            embed = function(inputs, headers)
                local response, err = require('CopilotChat.utils').curl_post('https://generativelanguage.googleapis.com/v1beta/openai/embeddings', {
                    headers = headers,
                    json_request = true,
                    json_response = true,
                    body = {
                        input = inputs,
                        model = 'text-embedding-004',
                    },
                })

                if err then
                    error(err)
                end

                return response.body.data
            end,

            get_url = function()
                return 'https://generativelanguage.googleapis.com/v1beta/openai/chat/completions'
            end,
        },
        openai = {
            prepare_input = require("CopilotChat.config.providers").copilot.prepare_input,
            prepare_output = require("CopilotChat.config.providers").copilot.prepare_output,

            get_url = function() return "https://api.openai.com/v1/chat/completions" end,

            get_headers = function()
                local api_key = assert(os.getenv("OPENAI_API_KEY"), "OPENAI_API_KEY env var not set")
                return {
                    Authorization = "Bearer " .. api_key,
                    ["Content-Type"] = "application/json",
                }
            end,

            get_models = function(headers)
                local response, err =
                require("CopilotChat.utils").curl_get("https://api.openai.com/v1/models", {
                    headers = headers,
                    json_response = true,
                })
                if err then error(err) end
                return vim
                .iter(response.body.data)
                :filter(function(model)
                    local exclude_patterns = {
                        "audio",
                        "babbage",
                        "dall%-e",
                        "davinci",
                        "embedding",
                        "image",
                        "moderation",
                        "realtime",
                        "transcribe",
                        "tts",
                        "whisper",
                    }
                    for _, pattern in ipairs(exclude_patterns) do
                        if model.id:match(pattern) then return false end
                    end
                    return true
                end)
                :map(
                    function(model)
                        return {
                            id = model.id,
                            name = model.id,
                        }
                    end
                )
                :totable()
            end,

            embed = function(inputs, headers)
                local response, err =
                require("CopilotChat.utils").curl_post("https://api.openai.com/v1/embeddings", {
                    headers = headers,
                    json_request = true,
                    json_response = true,
                    body = {
                        model = "text-embedding-3-small",
                        input = inputs,
                    },
                })
                if err then
                    error(err)
                    print("The error is "..err)
                end
                return response.body.data
            end,
        },
        ollama = {
            prepare_input = require('CopilotChat.config.providers').copilot.prepare_input,
            prepare_output = require('CopilotChat.config.providers').copilot.prepare_output,

            get_headers = function()
                return {
                    ['Content-Type'] = 'application/json',
                }
            end,

            get_models = function(headers)
                local response, err = require('CopilotChat.utils').curl_get('http://localhost:11434/api/tags', {
                    headers = headers,
                    json_request = true,
                    json_response = true,
                })

                if err then
                    error(err)
                end

                return vim.tbl_map(function(model)
                    return {
                        id = model.model,
                        name = model.name,
                    }
                end, response.body.models)
            end,

            embed = function(inputs, headers)
                local response, err = require('CopilotChat.utils').curl_post('http://localhost:11434/v1/embeddings', {
                    headers = headers,
                    json_request = true,
                    json_response = true,
                    body = {
                        input = inputs,
                        model = 'codellama:latest',
                    },
                })

                if err then
                    --print("This is the error: "..err)
                    error(err)
                end
                --print("The output is "..response.body.embeddings[0])

                return response.body.data
            end,

            get_url = function()
                return 'http://localhost:11434/v1/chat/completions'
            end,
        },
    },
}

vim.keymap.set("n","<leader>c",":CopilotChat<CR>",{noremap=true,silent=true})

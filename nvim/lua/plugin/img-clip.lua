local imgclip = require("img-clip")

imgclip.setup({
    default = {
        -- file and directory options
        dir_path = "asset/image/", ---@type string | fun(): string
        extension = "png", ---@type string | fun(): string
        file_name = "%Y-%m-%d-%H-%M-%S", ---@type string | fun(): string
        use_absolute_path = false, ---@type boolean | fun(): boolean
        relative_to_current_file = false, ---@type boolean | fun(): boolean

        -- template options
        template = "$FILE_PATH", ---@type string | fun(context: table): string
        url_encode_path = false, ---@type boolean | fun(): boolean
        relative_template_path = true, ---@type boolean | fun(): boolean
        use_cursor_in_template = true, ---@type boolean | fun(): boolean
        insert_mode_after_paste = true, ---@type boolean | fun(): boolean

        -- prompt options
        prompt_for_file_name = true, ---@type boolean | fun(): boolean
        show_dir_path_in_prompt = true, ---@type boolean | fun(): boolean

        -- base64 options
        max_base64_size = 10, ---@type number | fun(): number
        embed_image_as_base64 = false, ---@type boolean | fun(): boolean

        -- image options
        process_cmd = "", ---@type string | fun(): string
        copy_images = false, ---@type boolean | fun(): boolean
        download_images = true, ---@type boolean | fun(): boolean

        -- drag and drop options
        drag_and_drop = {
            enabled = true, ---@type boolean | fun(): boolean
            insert_mode = true, ---@type boolean | fun(): boolean
        },
    },

    -- filetype specific options
    filetypes = {
        markdown = {
            url_encode_path = true, ---@type boolean | fun(): boolean
            template = "![$CURSOR]($FILE_PATH)", ---@type string | fun(context: table): string
            download_images = false, ---@type boolean | fun(): boolean
        },

        tex = {
            relative_template_path = false, ---@type boolean | fun(): boolean
            template = [[
            \begin{figure}[h]
                \centering
                \includegraphics[width=0.8\textwidth]{$FILE_PATH}
                \caption{$CURSOR}
                \label{fig:$LABEL}
            \end{figure}
            ]], ---@type string | fun(context: table): string
        },

        typst = {
            template = [[
            #figure(
                image("$FILE_PATH", width: 80%),
                caption: [$CURSOR],
            ) <fig-$LABEL>
            ]], ---@type string | fun(context: table): string
        },

    },

    -- file, directory, and custom triggered options
    files = {}, ---@type table | fun(): table
    dirs = {}, ---@type table | fun(): table
    custom = {}, ---@type table | fun(): table
}
)

function paste_image()
    imgclip.paste_image({
        use_absolute_path = false,
    },"tru.png")
end

vim.keymap.set({"i","n"},"<A-S-V>",paste_image)

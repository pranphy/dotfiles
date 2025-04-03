local snacks = require("snacks")
local util = require("st.util")


Snacks.setup({
    --bigfile = { enabled = true },
    --dashboard = { enabled = true },
    explorer = { enabled = true },
    --indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = false,
      timeout = 3000,
    },
    image = {enabled = util.ternary(vim.g.neovide, false, true)},
    picker = { enabled = true,
        files = { hidden=false, ignored=false},
    },
    terminal = { style="terminal" },
    --quickfile = { enabled = true },
    --scope = { enabled = true },
    --scroll = { enabled = false},
    --statuscolumn = { enabled = true },
    --words = { enabled = true },
    --stypes = {
    --  notification = {
    --    -- wo = { wrap = true } -- Wrap notifications
    --  }
    --}
})

function find_files()
    return Snacks.picker.files({
        --cmd = {"rg", "--no-ignore-vcs", "--ignore-file ", vim.env.HOME.."~/.rgignore", "--smart-case"},
        cmd = "rg",
        hidden=false, ignored=true
    })
end

function find_dotfiles()
    appname = vim.env.NVIM_APPNAME
    if appname == "" or appname == nil  then appname = "nvim" end
    return Snacks.picker.files({cwd = "~/.config/"..appname, cmd = "rg"})
end

function toggle_floatterm()
    return Snacks.terminal.toggle("bash",{
        win = {
            style = { border = "rounded", width= 0.65, height = 0.95 },
        },
    })
end



-- Explorer
vim.keymap.set("n","<Leader>nt", Snacks.explorer.reveal)
vim.keymap.set("n","<leader>si", Snacks.picker.icons) -- Icons,
vim.keymap.set("n","<leader>ff", find_files) -- Find Files,
vim.keymap.set("n","<leader>fd", find_dotfiles) -- desc = "Find Config File" },
vim.keymap.set("n","<leader>fp", function()
    snacks.picker.projects({
        dev={"~/repos","~/simana","~/sft/**/*"},
        patterns = { ".git","compile_commands.json", "Makefile" },
    })
end)

vim.keymap.set("n","<leader>fg", Snacks.picker.grep ) -- Grep,

if vim.g.neovide then
    vim.keymap.set({"n","i","t"},"<C-Z>",toggle_floatterm)
end


-- Git
--vim.keymap.set("n","<leader>gB", function() snacks.gitbrowse() end) -- Git Browse", mode = { "n", "v },
--vim.keymap.set("n","<leader>gg", function() snacks.lazygit() end) -- Lazygit,

-- QOL
vim.keymap.set("n","<leader>uC",Snacks.picker.colorschemes) -- Colorschemes,

-- Picker
vim.keymap.set("n","gD", function() snacks.picker.lsp_declarations() end) -- Goto Declaration,
vim.keymap.set("n","gd", function() snacks.picker.lsp_definitions() end) -- Goto Definition,
vim.keymap.set("n","gI", function() snacks.picker.lsp_implementations() end) -- Goto Implementation,
vim.keymap.set("n","gy", function() snacks.picker.lsp_type_definitions() end) -- Goto T[y]pe Definition,
vim.keymap.set("n","<leader>fb", function() snacks.picker.buffers() end) -- Buffers,
--vim.keymap.set({"n"},"<leader>ff", function() snacks.picker.files() end) -- Find Files,
--vim.keymap.set({"n"},"<leader>fg", function()  snacks.picker.git_files() end) -- Find Git Files,
vim.keymap.set({"n"},"<leader>fr", function() snacks.picker.recent() end) -- Recent,
vim.keymap.set({"n"},"<leader>,", function() snacks.picker.buffers() end) -- Buffers,
vim.keymap.set({"n"},"<leader>:", function() snacks.picker.command_history() end) -- Command History,
vim.keymap.set({"n"},"<leader>gb", function() snacks.picker.git_branches() end) -- Git Branches,
vim.keymap.set({"n"},"<leader>gd", function() snacks.picker.git_diff() end) -- Git Diff (Hunks),
vim.keymap.set({"n"},"<leader>gf", function() snacks.picker.git_log_file() end) -- Git Log File,
vim.keymap.set({"n"},"<leader>gl", function() snacks.picker.git_log() end) -- Git Log,
vim.keymap.set({"n"},"<leader>gL", function() snacks.picker.git_log_line() end) -- Git Log Line,
vim.keymap.set({"n"},"<leader>gS", function() snacks.picker.git_stash() end) -- Git Stash,
vim.keymap.set({"n"},"<leader>gs", function() snacks.picker.git_status() end) -- Git Status,
vim.keymap.set({"n"},"<leader>n", function() snacks.picker.notifications() end) -- Notification History,
vim.keymap.set({"n"},"<leader>sa", function() snacks.picker.autocmds() end) -- Autocmds,
vim.keymap.set({"n"},"<leader>sB", function() snacks.picker.grep_buffers() end) -- Grep Open Buffers,
vim.keymap.set({"n"},"<leader>sb", function() snacks.picker.lines() end) -- Buffer Lines,
vim.keymap.set({"n"},"<leader>sc", function() snacks.picker.command_history() end) -- Command History,
vim.keymap.set({"n"},"<leader>sC", function() snacks.picker.commands() end) -- Commands,
vim.keymap.set({"n"},"<leader>sD", function() snacks.picker.diagnostics_buffer() end) -- Buffer Diagnostics,
vim.keymap.set({"n"},"<leader>sd", function() snacks.picker.diagnostics() end) -- Diagnostics,
vim.keymap.set("n",'<leader>s"', function() snacks.picker.registers() end ) --, desc = "Registers" },
vim.keymap.set({"n"},"<leader>sg", function() snacks.picker.grep() end) -- Grep,
vim.keymap.set({"n"},"<leader>sh", function() snacks.picker.help() end) -- Help Pages,
vim.keymap.set({"n"},"<leader>sH", function() snacks.picker.highlights() end) -- Highlights,
vim.keymap.set({"n"},"<leader>sj", function() snacks.picker.jumps() end) -- Jumps,
vim.keymap.set({"n"},"<leader>sk", function() snacks.picker.keymaps() end) -- Keymaps,
vim.keymap.set({"n"},"<leader>sl", function() snacks.picker.loclist() end) -- Location List,
vim.keymap.set({"n"},"<leader>sM", function() snacks.picker.man() end) -- Man Pages,
vim.keymap.set({"n"},"<leader>sm", function() snacks.picker.marks() end) -- Marks,
vim.keymap.set({"n"},"<leader><space>", function() snacks.picker.smart() end) -- Smart Find Files,
vim.keymap.set({"n"},"<leader>sp", function() snacks.picker.lazy() end) -- Search for Plugin Spec,
vim.keymap.set({"n"},"<leader>sq", function() snacks.picker.qflist() end) -- Quickfix List,
vim.keymap.set({"n"},"<leader>sR", function() snacks.picker.resume() end) -- Resume,
vim.keymap.set({"n"},"<leader>ss", function() snacks.picker.lsp_symbols() end) -- LSP Symbols,
vim.keymap.set({"n"},"<leader>sS", function() snacks.picker.lsp_workspace_symbols() end) -- LSP Workspace Symbols,
vim.keymap.set({"n"},"<leader>sw", function() snacks.picker.grep_word() end) -- Visual selection or word", mode = { "n", "x },
vim.keymap.set({"n", "x"},"<leader>su",function () snacks.picker.undo() end ) -- Undo History,
vim.keymap.set("n",'<leader>s/', function() snacks.picker.search_history() end ) --, desc = "Search History" },

-- Zen Mode

function zen_mode_toggle()
    return Snacks.zen({
        width = 0.36,
        toggles = {
            dim = false,
            git_signs = false,
            mini_diff_signs = false,
            diagnostics = false,
            inlay_hints = false
        },
        window = {
            width = .35 -- width will be 85% of the editor width
        },
        zoom = {
            win = {
                backdrop = true,
                width = 0.4, -- full width
            },
        },
    })
end
--vim.keymap.set("n", "<leader>m",  function () Snacks.zen() end )
vim.keymap.set("n", "<leader>z",  zen_mode_toggle)

-- Notifications
--vim.keymap.set({"n"},"<leader>un", function() snacks.notifier.hide() end) -- Dismiss All Notifications,


-- Misc

--{ "<leader>.",  function() snacks.scratch() end, desc = "Toggle Scratch Buffer" },
--{ "<leader>n",  function() snacks.notifier.show_history() end, desc = "Notification History" },
--{ "<leader>S",  function() snacks.scratch.select() end, desc = "Select Scratch Buffer" },

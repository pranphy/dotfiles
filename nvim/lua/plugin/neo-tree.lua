require("neo-tree").setup({
  source_selector = {
    winbar = true,
    statusline = true,
  },
  window = {
    position = "left",
    width = 40,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = { ["l"] = "open", ["h"] = "close" },
  }
})

vim.keymap.set("n","<leader>nt",":Neotree<cr>")

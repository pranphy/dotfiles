local command = vim.api.nvim_create_user_command

command("MyRepl",function()
  vim.cmd[[:vert Repl]]
  vim.keymap.set("i","jj",";<esc>_gzt;o",{remap=true})
  vim.keymap.set("n","<CR>","_gzt;",{remap=true})
end, {}
)

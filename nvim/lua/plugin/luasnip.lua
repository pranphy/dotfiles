-- ft: lua
local ls = require("luasnip")
local lsu = require("lsnp.utils")


ls.setup({ snip_env = {
    mfs = lsu.mfs,
    fs = lsu.fs,
}})


require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/luasnip/"})

vim.keymap.set("i", "qin", function() print("mfs",lsu.test()) end, {silent = true})
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, {silent = true})


ls.config.set_config({history=false,enable_autosnippets=true})

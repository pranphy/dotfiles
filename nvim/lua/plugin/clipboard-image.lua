require'clipboard-image'.setup {
  default = {
    img_dir={"asset","image","paste"},
    img_dir_txt = "asset/image/paste",
    img_name = function ()
      vim.fn.inputsave()
      local name = vim.fn.input('Name: ')
      vim.fn.inputrestore()
      local date = os.date("%Y%m%d-%H%M%S")
      return date.."-"..name
    end,
  }
}

vim.keymap.set({"i","n"},"<A-S-V>",require"clipboard-image.paste".paste_img)

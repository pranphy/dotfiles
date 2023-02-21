require'clipboard-image'.setup {
  default = {
    img_dir={"assets","img","paste"},
    img_dir_txt = "assets/img/paste",
    img_name = function ()
      vim.fn.inputsave()

      local name = vim.fn.input('Name: ')
      vim.fn.inputrestore()
      local date = os.date("%Y%m%d-%H%M%S")
      return date.."-"..name
    end,
  }
}

vim.keymap.set({"i","n"},"<A-S-V>","<esc>:PasteImg<cr>a")

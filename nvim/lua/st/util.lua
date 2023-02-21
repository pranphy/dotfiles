local M = {}

function M.date_ymd()
    return os.date("%Y-%m-%d")
end

function M.format_selected_table_latex()
end

function M.make_transparent()
  vim.cmd[[
  highlight SignColumn guibg=NONE
  highlight Normal guibg=NONE ctermbg=NONE
  highlight VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
  ]]
end

return M

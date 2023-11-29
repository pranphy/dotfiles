local M = {}

function M.date_ymd()
    return os.date("%Y-%m-%d")
end

function M.format_selected_table_latex()
end



function M.make_transparent()
  local groups = { "SignColumn", "Normal", "Special", "NormalFloat", "VertSplit" }
  for _,group in ipairs(groups) do
    vim.api.nvim_set_hl(0,group,{bg = "None", ctermbg = "NONE" })
  end
end


return M

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

function M.ternary(condition, if_true, if_false)
    if condition then
        return if_true
    else
        return if_false
    end
end


return M

local dap, dapui =require("dap"),require("dapui")

dap.listeners.after.event_initialized["dapui_config"]=function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"]=function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"]=function()
  dapui.close()
end
-- dapui end

dapui.setup()
require("nvim-dap-virtual-text").setup()
--
--
dap.adapters.gdb = {
    id = 'gdb',
    type = 'executable',
    command = 'gdb',
    args = { '--quiet', '--interpreter=dap' },
}
dap.configurations.cpp = {
    {
      name = "Launch-Old",
      type = "gdb",
      request = "launch",
      linux = {
        MIMode = "gdb",
        miDebuggerPath = "/usr/bin/gdb"
      },
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
    },
  }

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require('dap.ext.vscode').load_launchjs(nil, { cppdbg = {'c', 'cpp'} })


vim.keymap.set('n', '<leader>dn', dap.continue)
vim.keymap.set('n', '<leader>db', dap.continue)
vim.keymap.set('n', '<leader>do', dap.step_over)
vim.keymap.set('n', '<leader>di', dap.step_into)
vim.keymap.set('n', '<leader>dt', dap.step_out)
vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<Leader>B', dap.set_breakpoint)
vim.keymap.set('n', '<Leader>dr', dap.repl.open)
vim.keymap.set('n', '<Leader>dl', dap.run_last)
vim.keymap.set({'n', 'v'}, '<Leader>dh',  require('dap.ui.widgets').hover)
vim.keymap.set({'n', 'v'}, '<Leader>dp', require('dap.ui.widgets').preview)
vim.keymap.set('n', '<Leader>df', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames) end)
vim.keymap.set('n', '<Leader>ds', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes) end)

-- vim.keymap.set("n","<silent>dc",dap.continue)
-- vim.keymap.set("n","<silent><F5>",dap.continue)
-- vim.keymap.set("n","<silent><F10>",dap.step_over)
-- vim.keymap.set("n","<silent><F11>",dap.step_into)
-- vim.keymap.set("n","<silent><F12>",dap.step_out)
-- 
-- 
-- vim.keymap.set("n","<leader>b",dap.toggle_breakpoint)
-- vim.keymap.set("n","<silent>dr",dap.repl.open)


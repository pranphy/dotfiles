local dap = require('dap')
dap.adapters.lldb = {
  id = 'cppdbg',
  type = 'executable',
  command = '/usr/bin/lldb-vscode-14',
  name = 'lldb'
}

local dap = require('dap')
dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'a.out')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


vim.keymap.set("n","<silent>dc",dap.continue)
vim.keymap.set("n","<silent><F5>",dap.continue)
vim.keymap.set("n","<silent><F10>",dap.step_over)
vim.keymap.set("n","<silent><F11>",dap.step_into)
vim.keymap.set("n","<silent><F12>",dap.step_out)


vim.keymap.set("n","<leader>b",dap.toggle_breakpoint)
vim.keymap.set("n","<silent>dr",dap.repl.open)


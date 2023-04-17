vim.cmd[[
let g:repl_config = {
            \   'javascript': { 'cmd': 'node' },
            \   'clojure': {
            \     'cmd': 'clj',
            \     'rlwrap': 1
            \   },
            \   'scheme': { 'cmd': 'rlwrap csi' },
            \   'julia':  { 'cmd': 'julia' },
            \   'cpp':  { 'cmd': 'reroot -l' },
            \   'python':  { 'cmd': 'python3' }
            \ }
]]

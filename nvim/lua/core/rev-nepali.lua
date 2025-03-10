-- This file is extensively for insert mode mapping
-- for devanagari characters in my keymap layout.

local M = {}

vim.b.nep_act = false

local nep_map = {
  ["$"] = "द्ध",
  ["0"] = "०",
  ["1"] = "१",
  ["2"] = "२",
  ["3"] = "३",
  ["4"] = "४",
  ["5"] = "५",
  ["6"] = "६",
  ["7"] = "७",
  ["8"] = "८",
  ["9"] = "९",
  ["A"] = "आ",
  ["a"] = "ब",
  ["b"] = "द",
  ["B"] = "ौ",
  ["c"] = "अ",
  ["C"] = "ऋ",
  ["d"] = "म",
  ["D"] = "म्",
  ["E"] = "ऐ",
  ["e"] = "भ",
  ["F"] = "ँँ",
  ["f"] = "ा",
  ["g"] = "न",
  ["G"] = "न्",
  ["h"] = "ज",
  ["H"] = "झ",
  ["I"] = "क्ष",
  ["i"] = "ष",
  ["j"] = "व",
  ["J"] = "ो",
  ["k"] = "प",
  ["K"] = "फ",
  ["l"] = "ि",
  ["L"] = "ी",
  ["m"] = "‌", -- zwnj
  ["M"] = "ः",
  ["n"] = "ल",
  ["N"] = "ल्",
  ["O"] = "इ",
  ["o"] = "य",
  ["p"] = "उ",
  ["P"] = "ए",
  ["Q"] = "त्त",
  ["q"] = "त्र",
  ["+"] = "ं",
  ["."] = "।",
  ["r"] = "च",
  ["R"] = "च्",
  ["s"] = "क",
  ["S"] = "क्",
  ["t"] = "त",
  ["T"] = "त्",
  ["U"] = "ऊ",
  ["u"] = "ग",
  ["V"] = "ॐ",
  ["v"] = "ख",
  ["w"] = "ध",
  ["W"] = "ध्",
  ["x"] = "ह",
  ["X"] = "ह्",
  ["y"] = "थ",
  ["Y"] = "थ्",
  ["z"] = "श",
  ["Z"] = "श्",
  ["`"] = "ञ",
  ["@"] = "ई",
  ["_"] = "ओ",
  ["="] = "औ",
  ["#"] = "घ",
  ["<"] = "ङ",
  ["%"] = "छ",
  ["!"] = "ज्ञ",
  ["^"] = "ट",
  ["&"] = "ठ",
  ["*"] = "ड",
  ["("] = "ढ",
  [")"] = "ण",
  ["/"] = "र",
  [">"] = "श्र",
  [";"] = "स",
  [":"] = "स्",
  ["'"] = "ु",
  ["\\"] = "्",
  ['"'] = "ू",
  ["["] = "ृ",
  ["]"] = "े",
  ["}"] = "ै",
  ["|"] = "‍" -- zwj
}

function M.enable()
    for asc, dev in pairs(nep_map) do
        vim.keymap.set("i",asc,dev,{remap = false, buffer = true} )
        vim.keymap.set("i","{"..asc,asc,{remap=false,buffer=true})
    end
    vim.b.nep_act = true
end


function M.disable()
    for asc, dev in pairs(nep_map) do
        vim.keymap.del("i",asc,{buffer = true} )
        vim.keymap.del("i","{"..asc,{remap=false,buffer=true})
    end
    vim.b.nep_act = false
end

function M.toggle()
    if vim.b.nep_act == true then
        M.disable()
    else
        M.enable()
    end
end


return M


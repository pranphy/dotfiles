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
  ["a"] = "ो",
  ["A"] = "ओ",
  ["b"] = "व",
  ["B"] = "ौ",
  ["c"] = "म",
  ["C"] = "ण",
  ["d"] = "्",
  ["D"] = "अ",
  ["E"] = "आ",
  ["e"] = "ा",
  ["f"] = "ि",
  ["F"] = "इ",
  ["g"] = "ु",
  ["G"] = "उ",
  ["h"] = "प",
  ["H"] = "फ",
  ["I"] = "घ",
  ["i"] = "ग",
  ["j"] = "र",
  ["J"] = "ो",
  ["k"] = "क",
  ["K"] = "ख",
  ["l"] = "त",
  ["L"] = "थ",
  ["m"] = "स",
  ["M"] = "श",
  ["n"] = "ल",
  ["N"] = "ल्",
  ["O"] = "ध",
  ["o"] = "द",
  ["p"] = "ज",
  ["P"] = "झ",
  ["Q"] = "औ",
  ["q"] = "ै",
  ["="] = "ृ",
  ["+"] = "ऋ",
  ["r"] = "ी",
  ["R"] = "ई",
  ["s"] = "े",
  ["S"] = "ए",
  ["t"] = "ू",
  ["T"] = "ऊ",
  ["U"] = "ङ",
  ["u"] = "ह",
  ["V"] = "न",
  ["v"] = "न",
  ["w"] = "ै",
  ["W"] = "ऐ",
  ["x"] = "ं",
  ["X"] = "ँ",
  ["y"] = "ब",
  ["Y"] = "भ",
  ["z"] = "श",
  ["Z"] = "श्",
  ["@"] = "ई",
  ["_"] = "_",
  ["#"] = "्र",
  ["<"] = "ष",
  ["%"] = "ज्ञ",
  ["&"] = "क्ष",
  ["*"] =  "श्र",
  ["("] = "ढ",
  [")"] = "ण",
  ["/"] = "य",
  [">"] = "्",
  [";"] = "च",
  [":"] = "छ",
  ["'"] = "ट",
  ["\\"] = "्",
  ['"'] = "ठ",
  ["["] = "ड",
  ["}"] = "ञ",
}

for asc, dev in pairs(nep_map) do
   vim.keymap.set("i",asc,dev,{remap = false, buffer = true} )
end

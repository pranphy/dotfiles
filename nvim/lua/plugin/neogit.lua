local neogit = require("neogit")

neogit.setup {
  kind = "tab",
  commit_popup = { kind = "split", },
  signs = {
    -- { CLOSED, OPENED }
    section = { "", "" },
    item = { "", "" },
    hunk = { "", "" },
  },
  integrations = { diffview = true },
}

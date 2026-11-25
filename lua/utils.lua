-- Central utility functions

local M = {}
local map = vim.keymap.set

-- ── Keymap helpers ───────────────────────────────────────────────────────────

local function opts(desc, extra)
    return vim.tbl_extend("force", { silent = true, desc = desc }, extra or {})
end

function M.nmap(lhs, rhs, desc, extra)
    map("n", lhs, rhs, opts(desc, extra))
end
function M.imap(lhs, rhs, desc, extra)
    map("i", lhs, rhs, opts(desc, extra))
end
function M.vmap(lhs, rhs, desc, extra)
    map("v", lhs, rhs, opts(desc, extra))
end
function M.tmap(lhs, rhs, desc, extra)
    map("t", lhs, rhs, opts(desc, extra))
end
function M.nvmap(lhs, rhs, desc, extra)
    map({ "n", "v" }, lhs, rhs, opts(desc, extra))
end

function M.opts(desc, extra)
    return vim.tbl_extend("force", { silent = true, desc = desc }, extra or {})
end

return M

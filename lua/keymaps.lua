vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- ======================
-- Helpers (balanced)
-- ======================
local function opts(desc, extra)
  return vim.tbl_extend("force", { silent = true, desc = desc }, extra or {})
end

local function nmap(lhs, rhs, desc, extra)
  map("n", lhs, rhs, opts(desc, extra))
end

local function vmap(lhs, rhs, desc, extra)
  map("v", lhs, rhs, opts(desc, extra))
end

-- Disable space
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- ======================
-- General
-- ======================
nmap("<C-k>", "<cmd>wincmd k<cr>", "Window up")
nmap("<C-j>", "<cmd>wincmd j<cr>", "Window down")
nmap("<C-h>", "<cmd>wincmd h<cr>", "Window left")
nmap("<C-l>", "<cmd>wincmd l<cr>", "Window right")

nmap("<leader>e", "<cmd>Neotree toggle<cr>", "Explorer")

nmap("<leader>q", "<cmd>quit<cr>", "Quit")
nmap("<leader>w", "<cmd>w<cr>", "Save")
nmap("<leader>Q", "<cmd>quitall<cr>", "Quit all")
nmap("<leader>h", "<cmd>nohlsearch<CR>", "No highlight")

-- Comment.nvim (requires remap)
nmap("<leader>/", "gcc", "Toggle comment", { remap = true })
vmap("<leader>/", "gc",  "Toggle comment", { remap = true })

-- ======================
-- Buffers
-- ======================
nmap("<M-l>", "<cmd>BufferLineCycleNext<CR>", "Next Buffer")
nmap("<M-h>", "<cmd>BufferLineCyclePrev<CR>", "Previous Buffer")

nmap("<leader>c", function()
  require("mini.bufremove").delete(0, false)
end, "Close buffer")

-- ======================
-- Gitsigns
-- ======================

-- Navigation
nmap("]c", "<cmd>lua if vim.wo.diff then vim.cmd.normal({']c', bang = true}) else require('gitsigns').nav_hunk('next') end<CR>", "Next Hunk")
nmap("[c", "<cmd>lua if vim.wo.diff then vim.cmd.normal({'[c', bang = true}) else require('gitsigns').nav_hunk('prev') end<CR>", "Prev Hunk")

-- Actions
nmap("<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<CR>", "Reset Hunk")

vmap("<leader>gs", "<cmd>lua require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>", "Stage Hunk")
vmap("<leader>gr", "<cmd>lua require('gitsigns').reset_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>", "Reset Hunk")

nmap("<leader>gS", "<cmd>lua require('gitsigns').stage_buffer()<CR>", "Stage Buffer")
nmap("<leader>gR", "<cmd>lua require('gitsigns').reset_buffer()<CR>", "Reset Buffer")
nmap("<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<CR>", "Preview Hunk")
nmap("<leader>gi", "<cmd>lua require('gitsigns').preview_hunk_inline()<CR>", "Preview Inline Hunk")

nmap("<leader>gb", "<cmd>lua require('gitsigns').blame_line({ full = true })<CR>", "Blame Line")

nmap("<leader>gd", "<cmd>lua require('gitsigns').diffthis()<CR>", "Diff This")
nmap("<leader>gD", "<cmd>lua require('gitsigns').diffthis('~')<CR>", "Diff ~")

nmap("<leader>gQ", "<cmd>lua require('gitsigns').setqflist('all')<CR>", "Quickfix (All)")
nmap("<leader>gq", "<cmd>lua require('gitsigns').setqflist()<CR>", "Quickfix")

-- Toggles
nmap("<leader>gB", "<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>", "Toggle Blame")
nmap("<leader>gw", "<cmd>lua require('gitsigns').toggle_word_diff()<CR>", "Toggle Word Diff")

-- Text object
map({ "o", "x" }, "gh", "<cmd>lua require('gitsigns').select_hunk()<CR>", opts("Select Hunk"))

-- ======================
-- Flutter
-- ======================
nmap("<leader>fc", "<cmd>FlutterCopyProfilerUrl<cr>", "Copy Profiler Url")
nmap("<leader>fC", "<cmd>Telescope flutter commands<CR>", "Commands")
nmap("<leader>fd", "<cmd>FlutterDevices<cr>", "Devices")
nmap("<leader>fe", "<cmd>FlutterEmulators<cr>", "Emulators")
nmap("<leader>fh", "<cmd>FlutterReload<cr>", "Hot Reload")
nmap("<leader>fH", "<cmd>FlutterRestart<cr>", "Hot Restart")
nmap("<leader>fl", "<cmd>FlutterLogToggle<cr>", "Log Toggle")
nmap("<leader>fo", "<cmd>FlutterOutlineToggle<cr>", "Outline")
nmap("<leader>fp", "<cmd>FlutterPubGet<cr>", "Pub Get")
nmap("<leader>fq", "<cmd>FlutterQuit<cr>", "Quit")
nmap("<leader>fr", "<cmd>FlutterRun<cr>", "Run")
nmap("<leader>ft", "<cmd>FlutterDevTools<cr>", "Dev Tools")
nmap("<leader>fx", "<cmd>FlutterLogClear<cr>", "Log Clear")

-- ======================
-- Search
-- ======================
nmap("<leader>sb", "<cmd>Telescope buffers<cr>", "Buffers")
nmap("<leader>sc", "<cmd>Telescope commands<cr>", "Commands")
nmap("<leader>sf", "<cmd>Telescope find_files<cr>", "Files")
nmap("<leader>sh", "<cmd>Telescope help_tags<cr>", "Help")
nmap("<leader>sH", "<cmd>Telescope highlights<cr>", "Highlight Groups")
nmap("<leader>sk", "<cmd>Telescope keymaps<cr>", "Keymaps")
nmap("<leader>sl", "<cmd>Telescope resume<cr>", "Last Picker")
nmap("<leader>sM", "<cmd>Telescope man_pages<cr>", "Man Pages")
nmap("<leader>sr", "<cmd>Telescope oldfiles<cr>", "Recent Files")
nmap("<leader>sR", "<cmd>Telescope registers<cr>", "Registers")
nmap("<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", "Symbols")
nmap("<leader>st", "<cmd>Telescope live_grep<cr>", "Text")
nmap("<leader>sw", "<cmd>Telescope grep_string<cr>", "Word")
nmap("<leader>su", "<cmd>Telescope undo<cr>", "Undo History")

-- ======================
-- Python
-- ======================
nmap("<leader>Pv", "<cmd>VenvSelect<cr>", "Venv select")

-- ======================
-- Session
-- ======================
nmap("<leader>rw", "<cmd>AutoSession search<cr>", "Select session")
nmap("<leader>rs", "<cmd>AutoSession save<cr>", "Save session")

-- ======================
-- Sudo
-- ======================
nmap("<leader>Sw", "<cmd>SudaWrite<CR>", "Save with Sudo")
nmap("<leader>Sr", "<cmd>SudaRead<CR>", "Open with Sudo")

-- ======================
-- Telescope
-- ======================
nmap("<leader>tp", "<cmd>Telescope projects<CR>", "Recent Projects")
nmap("<leader>tP", "<cmd>Telescope project<CR>", "Select Project")
nmap("<leader>tn", "<cmd>NoiceTelescope<CR>", "Noice Messages")

nmap("<leader>tc", function()
  require("telescope.builtin").live_grep({
    prompt_title = "Cheatsheets",
    cwd = vim.fn.expand("~/.utils/Cheatsheets"),
  })
end, "Cheatsheet")

nmap("<leader>tb", "<cmd>Telescope bookmarks list<cr>", "Bookmarks")

-- ======================
-- Trouble
-- ======================
nmap("<leader>yx", "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics")
nmap("<leader>yX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics")
nmap("<leader>yL", "<cmd>Trouble loclist toggle<cr>", "Location List")
nmap("<leader>yQ", "<cmd>Trouble qflist toggle<cr>", "Quickfix List")
nmap("<leader>ys", "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols")
nmap("<leader>yl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "LSP References")

-- ======================
-- LSP (buffer-local)
-- ======================
local M = {}

function M.setup_lsp_keymaps(buf, client)
  local telescope = require("telescope.builtin")

  local function lmap(mode, lhs, rhs, desc, extra)
    map(mode, lhs, rhs, opts(desc, vim.tbl_extend("force", { buffer = buf }, extra or {})))
  end

  lmap("n", "<leader>lr", vim.lsp.buf.rename, "Rename")
  lmap({ "n", "x" }, "<leader>la", vim.lsp.buf.code_action, "Code Action")

  lmap("n", "<leader>lf", function()
    require("conform").format({ async = true, lsp_fallback = true })
  end, "Format (Conform)")

  lmap("n", "<leader>lX", "<cmd>LspRestart<cr>", "Restart LSP")
  lmap("n", "<leader>lR", telescope.lsp_references, "References")
  lmap("n", "<leader>li", telescope.lsp_implementations, "Implementation")
  lmap("n", "<leader>ld", telescope.lsp_definitions, "Definitions")
  lmap("n", "<leader>lD", vim.lsp.buf.declaration, "Declaration")
  lmap("n", "<leader>ls", telescope.lsp_document_symbols, "Document Symbols")
  lmap("n", "<leader>lS", telescope.lsp_dynamic_workspace_symbols, "Workspace Symbols")
  lmap("n", "<leader>lt", telescope.lsp_type_definitions, "Type Definition")
  lmap("n", "gd", vim.lsp.buf.definition, "Goto Definition")

  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
    lmap("n", "<leader>lh", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }))
    end, "Toggle Inlay Hints")
  end
end

return M

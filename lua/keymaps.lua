vim.g.mapleader = " "
vim.g.maplocalleader = " "

local utils = require("utils")

local map = vim.keymap.set
local nmap = utils.nmap
local imap = utils.imap
local vmap = utils.vmap
local tmap = utils.tmap
local opts = utils.opts

-- Disable space
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- ======================
-- General
-- ======================
imap("jk", "<ESC>", "Exit Insert Mode") -- Common, fast exit from insert mode

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
vmap("<leader>/", "gc", "Toggle comment", { remap = true })

-- Move
nmap("<M-j>", function()
	require("mini.move").move_line("down")
end)
nmap("<M-k>", function()
	require("mini.move").move_line("up")
end)

vmap("<M-j>", function()
	require("mini.move").move_selection("down")
end)
vmap("<M-k>", function()
	require("mini.move").move_selection("up")
end)

-- ======================
-- TmuxNavigator
-- ======================
nmap("<C-h>", "<cmd>TmuxNavigateLeft<CR>")
nmap("<C-j>", "<cmd>TmuxNavigateDown<CR>")
nmap("<C-k>", "<cmd>TmuxNavigateUp<CR>")
nmap("<C-l>", "<cmd>TmuxNavigateRight<CR>")

-- ======================
-- Gitsigns
-- ======================
nmap(
	"]c",
	"<cmd>lua if vim.wo.diff then vim.cmd.normal({']c', bang = true}) else require('gitsigns').nav_hunk('next') end<CR>",
	"Next Hunk"
)
nmap(
	"[c",
	"<cmd>lua if vim.wo.diff then vim.cmd.normal({'[c', bang = true}) else require('gitsigns').nav_hunk('prev') end<CR>",
	"Prev Hunk"
)

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
-- Python
-- ======================
nmap("<leader>pv", "<cmd>VenvSelect<cr>", "Venv select")

-- ======================
-- Session
-- ======================
-- nmap("<leader>aa", "<cmd>AutoSession search<cr>", "[A]ll")
-- nmap("<leader>as", "<cmd>AutoSession save<cr>", "[S]ave")

-- ======================
-- Sudo
-- ======================
nmap("<leader>Sw", "<cmd>SudaWrite<CR>", "Save with Sudo")
nmap("<leader>Sr", "<cmd>SudaRead<CR>", "Open with Sudo")

-- ======================
-- Telescope
-- ======================
-- Search
nmap("<leader>sb", "<cmd>lua require('telescope.builtin').buffers()<CR>", "[S]earch [B]uffers")
nmap("<leader>sc", "<cmd>Telescope commands<cr>", "[S]earch [C]ommands")
nmap("<leader>sd", "<cmd>lua require('telescope.builtin').diagnostics()<CR>", "[S]earch [D]iagnostics")
nmap("<leader>sf", "<cmd>lua require('telescope.builtin').find_files()<CR>", "[S]earch [F]iles")
nmap("<leader>sh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", "[S]earch [H]elp")
nmap("<leader>sH", "<cmd>Telescope highlights<cr>", "[S]earch [H]ighlight Groups")
nmap("<leader>sk", "<cmd>lua require('telescope.builtin').keymaps()<CR>", "[S]earch [K]eymaps")
nmap("<leader>sl", "<cmd>lua require('telescope.builtin').resume()<CR>", "[S]earch [L]ast Picker")
nmap("<leader>sM", "<cmd>Telescope man_pages<cr>", "[Search] [M]an Pages")
nmap("<leader>sr", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", "[S]earch [R]ecent Files")
nmap("<leader>sR", "<cmd>Telescope registers<cr>", "[S]earch [R]egisters")
nmap("<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", "[Search] [S]ymbols")
nmap("<leader>st", "<cmd>lua require('telescope.builtin').live_grep()<CR>", "[S]earch [T]ext")
nmap("<leader>sT", "<cmd>lua require('telescope.builtin').builtin()<CR>", "[S]earch [T]elescope")
nmap("<leader>sw", "<cmd>lua require('telescope.builtin').grep_string()<CR>", "[S]earch current [W]ord")
nmap("<leader>su", "<cmd>Telescope undo<cr>", "[S]earch [U]ndo History")
nmap("<leader>sn", function()
	require("telescope.builtin").find_files({
		cwd = vim.fn.stdpath("config"),
	})
end, "[S]earch [N]eovim files")

-- Integrations
nmap("<leader>tb", "<cmd>Telescope bookmarks list<cr>", "Bookmarks")
nmap("<leader>tp", "<cmd>Telescope projects<CR>", "Recent Projects")
nmap("<leader>tP", "<cmd>Telescope project<CR>", "Select Project")
nmap("<leader>tn", "<cmd>NoiceTelescope<CR>", "Noice Messages")

nmap("<leader>tc", function()
	require("telescope.builtin").live_grep({
		prompt_title = "Cheatsheets",
		cwd = vim.fn.expand("~/.utils/Cheatsheets"),
	})
end, "Cheatsheet")

-- ======================
-- Buffer Actions
-- ======================
nmap(
	"<leader>bf",
	"<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<cr>",
	"[B]uffer [F]ormat (Conform)"
)
nmap("<leader>bh", "<cmd>BufferLineCloseLeft<CR>", "Close Left")
nmap("<leader>bl", "<cmd>BufferLineCloseRight<CR>", "Close Right")

nmap("<M-l>", "<cmd>BufferLineCycleNext<CR>", "Next Buffer")
nmap("<M-h>", "<cmd>BufferLineCyclePrev<CR>", "Previous Buffer")
nmap("<M-x>", function()
	require("mini.bufremove").delete(0, false)
end, "Close buffer")

nmap("<leader>c", function()
	require("mini.bufremove").delete(0, false)
end, "Close buffer")

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
-- ToggleTerm
-- ======================

-- Terminal 1 (horizontal)
nmap("<M-1>", "<cmd>1ToggleTerm direction=horizontal<CR>", "Terminal 1 (horizontal)")
tmap("<M-1>", [[<C-\><C-n><cmd>1ToggleTerm direction=horizontal<CR>]], "Terminal 1 (horizontal)")

-- Terminal 2 (vertical)
nmap("<M-2>", "<cmd>2ToggleTerm direction=vertical<CR>", "Terminal 2 (vertical)")
tmap("<M-2>", [[<C-\><C-n><cmd>2ToggleTerm direction=vertical<CR>]], "Terminal 2 (vertical)")

-- Terminal 3 (float)
nmap("<M-3>", "<cmd>3ToggleTerm direction=float<CR>", "Terminal 3 (float)")
tmap("<M-3>", [[<C-\><C-n><cmd>3ToggleTerm direction=float<CR>]], "Terminal 3 (float)")

-- ======================
-- DAP (Debug)
-- ======================

-- Alt + q - Throw Exception = Not Supported
-- Alt + z - Enable/Disable line breakpoint = Not Supported
-- Alt + a - View all break points = Not Supported
-- Alt + f - Mute/Unmute all breakpoints = Not Supported

-- Step into
nmap("<A-w>", function()
	require("dap").step_into()
end, "DAP: Step Into")

-- Evaluate expression
nmap("<A-e>", function()
	require("dapui").eval()
end, "DAP: Eval")

-- Resume / Continue
nmap("<A-r>", function()
	require("dap").continue()
end, "DAP: Continue")

-- Step over
nmap("<A-s>", function()
	require("dap").step_over()
end, "DAP: Step Over")

-- Step out (closest valid to "drop frame")
nmap("<A-d>", function()
	require("dap").step_out()
end, "DAP: Step Out")

-- REPL (closest valid "execution interaction")
nmap("<A-x>", function()
	require("dap").repl.open()
end, "DAP: REPL")

-- Run to cursor
nmap("<A-c>", function()
	require("dap").run_to_cursor()
end, "DAP: Run to Cursor")

-- Toggle breakpoint (line)
nmap("<A-v>", function()
	require("dap").toggle_breakpoint()
end, "DAP: Toggle Breakpoint")

-- Start / Select config
nmap("<leader>rd", function()
	require("dap").continue()
end, "Run Debugging")

-- Toggle UI manually
nmap("<A-5>", function()
	require("dapui").toggle()
end, "DAP: Toggle UI")

-- ======================
-- LSP (buffer-local)
-- ======================
local M = {}

function M.setup_lsp_keymaps(buf, client)
	local telescope = require("telescope.builtin")

	local function lmap(mode, lhs, rhs, desc, extra)
		map(mode, lhs, rhs, utils.opts(desc, vim.tbl_extend("force", { buffer = buf }, extra or {})))
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

	lmap("n", "<C-b>", vim.lsp.buf.definition, "Go to LSP Definition") -- This was vim.lsp.buf.definition, so kept it
	-- lmap("n", "<C-p>", "<cmd>lua require('lsp_signature').toggle_float_win()<cr>", { desc = "Toggle LSP Signature Float" })
	-- lmap("i", "<C-p>", "<cmd>lua require('lsp_signature').toggle_float_win()<cr>", { desc = "Toggle LSP Signature Float" })

	if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
		lmap("n", "<leader>lh", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }))
		end, "Toggle Inlay Hints")
	end
end

return M

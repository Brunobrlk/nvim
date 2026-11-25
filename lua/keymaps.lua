-- Central keymaps definition

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local utils = require("utils")

local map = vim.keymap.set
local nmap = utils.nmap
local imap = utils.imap
local vmap = utils.vmap
local tmap = utils.tmap
local nvmap = utils.nvmap
local opts = utils.opts

-- ======================
-- General
-- ======================
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true }) -- Disable space, it's leader
imap("jk", "<ESC>", "Exit Insert Mode")

nmap("<leader>e", "<cmd>Neotree toggle<cr>", "Explorer")
nmap("<leader>h", "<cmd>nohlsearch<CR>", "No highlight")
nmap("<leader>q", "<cmd>quit<cr>", "Quit")
nmap("<leader>Q", "<cmd>quitall<cr>", "Quit all")
nmap("<leader>w", "<cmd>w<cr>", "Save")
local function reveal_current_file_in_neotree()
    local current_buf = vim.api.nvim_get_current_buf()
    local buftype = vim.bo[current_buf].buftype
    local filepath = vim.api.nvim_buf_get_name(current_buf)

    if buftype ~= "" or filepath == "" then
        return
    end

    local ok, command = pcall(require, "neo-tree.command")
    if not ok then
        return
    end

    command.execute({
        action = "focus",
        source = "filesystem",
        position = "left",
        reveal_file = filepath,
        focus = true,
    })
end

nmap("<C-A-l>", reveal_current_file_in_neotree, "Reveal current file in Neo-tree")

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

-- TmuxNavigator
nmap("<C-h>", "<cmd>TmuxNavigateLeft<CR>", "Window left")
nmap("<C-j>", "<cmd>TmuxNavigateDown<CR>", "Window down")
nmap("<C-k>", "<cmd>TmuxNavigateUp<CR>", "Window up")
nmap("<C-l>", "<cmd>TmuxNavigateRight<CR>", "Window right")

-- ToggleTerm
nmap("<M-1>", "<cmd>1ToggleTerm direction=horizontal<CR>", "Terminal 1 (horizontal)")
tmap("<M-1>", [[<C-\><C-n><cmd>1ToggleTerm direction=horizontal<CR>]], "Terminal 1 (horizontal)")

nmap("<M-2>", "<cmd>2ToggleTerm direction=vertical<CR>", "Terminal 2 (vertical)")
tmap("<M-2>", [[<C-\><C-n><cmd>2ToggleTerm direction=vertical<CR>]], "Terminal 2 (vertical)")

nmap("<M-3>", "<cmd>3ToggleTerm direction=float<CR>", "Terminal 3 (float)")
tmap("<M-3>", [[<C-\><C-n><cmd>3ToggleTerm direction=float<CR>]], "Terminal 3 (float)")

tmap("<C-h>", [[<C-\><C-n><cmd>TmuxNavigateLeft<CR>]], "Window left")
tmap("<C-j>", [[<C-\><C-n><cmd>TmuxNavigateDown<CR>]], "Window down")
tmap("<C-k>", [[<C-\><C-n><cmd>TmuxNavigateUp<CR>]], "Window up")
tmap("<C-l>", [[<C-\><C-n><cmd>TmuxNavigateRight<CR>]], "Window right")

-- ======================
-- [B]uffer Actions
-- ======================
local function reload_current_buffer()
    if vim.bo.modified then
        vim.notify("Buffer has unsaved changes", vim.log.levels.WARN)
        return
    end

    vim.cmd("checktime")
    vim.cmd("edit")
    vim.notify("Buffer reloaded from disk")
end

nmap("<leader>bu", reload_current_buffer, "Update from disk")
nmap("<leader>bh", "<cmd>BufferLineCloseLeft<CR>", "Close Left")
nmap("<leader>bl", "<cmd>BufferLineCloseRight<CR>", "Close Right")

nmap("<M-l>", "<cmd>BufferLineCycleNext<CR>", "Next Buffer")
nmap("<M-h>", "<cmd>BufferLineCyclePrev<CR>", "Previous Buffer")

nmap("<leader>c", function()
    require("mini.bufremove").delete(0, false)
end, "Close buffer")

-- ======================
-- [P]ersistence
-- ======================
nmap("<leader>pa", "<cmd>lua require('persistence').select()<cr>", "All Sessions")
nmap("<leader>pc", "<cmd>lua require('persistence').load()<cr>", "Current dir")
nmap("<leader>pl", "<cmd>lua require('persistence').load({ last = true })<cr>", "Last")

local python_mappings = function()
    nmap("<leader>rr", function()
        local terminal = require("toggleterm.terminal").Terminal:new({
            cmd = (vim.fn.executable("python") == 1 and "python" or "python3") .. " main.py",
            dir = vim.fn.getcwd(),
            direction = "float",
            close_on_exit = false,
        })

        terminal:toggle()
    end, "Python: Run main.py")
    nmap("<leader>lv", "<cmd>VenvSelect<cr>", "Python: Venv select")
    dap_support()
end

local cpp_mappings = function(buf)
    if platformio_mappings(buf) then
        return
    end

    nmap("<leader>rr", function()
        local file = vim.api.nvim_buf_get_name(buf)
        local filename = vim.fn.fnamemodify(file, ":t")
        local terminal = require("toggleterm.terminal").Terminal:new({
            cmd = "buildcpp " .. vim.fn.shellescape(filename),
            dir = vim.fn.getcwd(),
            direction = "float",
            close_on_exit = false,
        })

        terminal:toggle()
    end, "C++: Run current file")
end

local c_mappings = function(buf)
    if platformio_mappings(buf) then
        return
    end

    nmap("<leader>rr", function()
        local file = vim.api.nvim_buf_get_name(buf)
        local filename = vim.fn.fnamemodify(file, ":t")
        local terminal = require("toggleterm.terminal").Terminal:new({
            cmd = "buildc " .. vim.fn.shellescape(filename),
            dir = vim.fn.getcwd(),
            direction = "float",
            close_on_exit = false,
        })

        terminal:toggle()
    end, "C: Run current file")
end

local languages_registry = { -- Trigger keymaps per filetype
    c = c_mappings,
    cpp = cpp_mappings,
    python = python_mappings,
}

-- ======================
-- [S]udo
-- ======================
nmap("<leader>Sw", "<cmd>SudaWrite<CR>", "Save with Sudo")
nmap("<leader>Sr", "<cmd>SudaRead<CR>", "Open with Sudo")

-- ======================
-- [S]earch Telescope
-- ======================
nmap("<leader>sb", "<cmd>lua require('telescope.builtin').buffers()<CR>", "Search Buffers")
nmap("<leader>sc", "<cmd>Telescope commands<cr>", "Search Commands")
nmap("<leader>sd", "<cmd>lua require('telescope.builtin').diagnostics()<CR>", "Search Diagnostics")
nmap("<leader>sf", "<cmd>lua require('telescope.builtin').find_files()<CR>", "Search Files")
nmap("<leader>sh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", "Search Help")
nmap("<leader>sH", "<cmd>Telescope highlights<cr>", "Search Highlight Groups")
nmap("<leader>sk", "<cmd>lua require('telescope.builtin').keymaps()<CR>", "Search Keymaps")
nmap("<leader>sl", "<cmd>lua require('telescope.builtin').resume()<CR>", "Search Last Picker")
nmap("<leader>sM", "<cmd>Telescope man_pages<cr>", "Search Man Pages")
nmap("<leader>sr", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", "Search Recent Files")
nmap("<leader>sR", "<cmd>Telescope registers<cr>", "Search Registers")
nmap("<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", "Search Symbols")
nmap("<leader>st", "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Search Text")
nmap("<leader>sT", "<cmd>lua require('telescope.builtin').builtin()<CR>", "Search Telescope")
nmap("<leader>sw", "<cmd>lua require('telescope.builtin').grep_string()<CR>", "Search current Word")
nmap("<leader>su", "<cmd>Telescope undo<cr>", "Search Undo History")
nmap("<leader>sn", function()
    require("telescope.builtin").find_files({
        cwd = vim.fn.stdpath("config"),
    })
end, "Search Neovim files")

-- ======================
-- [L]SP
-- ======================
local M = {}

function M.setup_language_keymaps(buf)
    if vim.b[buf].keymaps_loaded then -- prevent duplicate execution
        return
    end
    vim.b[buf].keymaps_loaded = true

    local ft = vim.bo[buf].filetype
    local fn = languages_registry[ft]

    if not fn then
        return
    end

    fn(buf)
end

return M

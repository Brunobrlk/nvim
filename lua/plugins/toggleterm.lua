return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        size = function(term)
            if term.direction == "horizontal" then
                return math.floor(vim.o.lines * 0.3)
            elseif term.direction == "vertical" then
                return math.floor(vim.o.columns * 0.3)
            end
        end,
        persist_mode = false,

        on_open = function(term)
            vim.cmd("startinsert!")
        end,
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = false,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = "curved",
            winblend = 0,
            width = function()
                return math.floor(vim.o.columns * 0.9)
            end,
            height = function()
                return math.floor(vim.o.lines * 0.8)
            end,
        },
    },

    keys = {
        { "<M-1>", "<cmd>1ToggleTerm direction=horizontal<CR>",             mode = "n" },
        { "<M-1>", [[<C-\><C-n><cmd>1ToggleTerm direction=horizontal<CR>]], mode = "t" },

        { "<M-2>", "<cmd>2ToggleTerm direction=vertical<CR>",               mode = "n" },
        { "<M-2>", [[<C-\><C-n><cmd>2ToggleTerm direction=vertical<CR>]],   mode = "t" },

        { "<M-3>", "<cmd>3ToggleTerm direction=float<CR>",                  mode = "n" },
        { "<M-3>", [[<C-\><C-n><cmd>3ToggleTerm direction=float<CR>]],      mode = "t" },
    },
}

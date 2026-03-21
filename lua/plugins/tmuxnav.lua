return {
    "christoomey/vim-tmux-navigator",
    lazy = false, -- Needs to be eager to work correctly
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious"
    },
    keys = {
        -- Migrated from your keymaps.lua to plugin's internal keymaps for better management
        { "<C-h>",  "<cmd>TmuxNavigateLeft<CR>",     desc = "Tmux: Navigate Left" },
        { "<C-j>",  "<cmd>TmuxNavigateDown<CR>",     desc = "Tmux: Navigate Down" },
        { "<C-k>",  "<cmd>TmuxNavigateUp<CR>",       desc = "Tmux: Navigate Up" },
        { "<C-l>",  "<cmd>TmuxNavigateRight<CR>",    desc = "Tmux: Navigate Right" },
        { "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", desc = "Tmux: Navigate Previous" },
    },
}

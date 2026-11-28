return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    branch = "main",
    cmd = "Neotree",
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            window = {
                width = 35,
                mappings = {
                    ["l"] = "open",
                    ["h"] = "close_node",
                },
            },
            default_component_configs = {
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    folder_empty_open = "",
                },
                modified = {
                    symbol = "",
                },
                git_status = {
                    symbols = {
                        added = "✚",
                        deleted = "✖",
                        modified = "",
                        renamed = "󰁕",
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                    align = "left",
                },
                indent = {
                    indent_size = 2,
                    with_markers = false,
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                },
            },
            clipboard = {
                sync = "universal",
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        ".git",
                        "node_modules",
                        ".cache",
                    },
                },
            },
        })
    end,
}

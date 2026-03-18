return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("neo-tree").setup({
            view = {
                preserve_window_proportions = true,
                width = 35,
                adaptive_size = true,
            },
            disable_netrw = true,
            hijack_netrw = true,
            open_on_setup = false, -- Only open on command
            open_on_resize = true,
            window = {
                mappings = {
                    ["l"] = "open",
                    ["h"] = "close_node",
                },
            },
            default_component_configs = {

                -- INFO: Icons
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    folder_empty_open = "",
                    default = "*",
                    highlight = "NeoTreeFileIcon",
                },
                provider = function(icon, node, state)
                    if node.type == "file" or node.type == "terminal" then
                        local success, web_devicons = pcall(require, "nvim-web-devicons")
                        local name = node.type == "terminal" and "terminal" or node.name
                        if success then
                            local devicon, hl = web_devicons.get_icon(name)
                            icon.text = devicon or icon.text
                            icon.highlight = hl or icon.highlight
                        end
                    end
                end,

                modified = {
                    symbol = "",
                    highlight = "NeoTreeModified",
                },

                git_status = {
                    symbols = {
                        -- Change type
                        added = "✚",
                        deleted = "✖",
                        modified = "",
                        renamed = "󰁕",
                        -- Status type
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                    align = "left",
                },

                -- INFO: Indent
                indent = {
                    indent_size = 2,
                    padding = 0,
                    with_markers = false,
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    -- indent_marker = "",
                    -- last_indent_marker = "",
                    -- highlight = "NeoTreeIndentMarker",
                    -- expander_highlight = "NeoTreeExpander",
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = true,
                    hide_gitignored = false,
                    hide_ignored = false,
                },
                group_empty_dirs = false,

            },
            filters = {
                dotfiles = true,
                custom = { ".git", "node_modules", ".cache" },
            },
            actions = {
                open_file = {
                    quit_on_open = false, -- Don't close tree when opening a file
                    resize_window = true,
                },
            },
        })
    end,
}

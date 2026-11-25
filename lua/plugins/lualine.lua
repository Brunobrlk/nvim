return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                icons_enabled = true,
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_last_status = true,
                globalstatus = true,
                refresh = {
                    events = {
                        "WinEnter",
                        "BufEnter",
                        "BufWritePost",
                        "SessionLoadPost",
                        "FileChangedShellPost",
                        "VimResized",
                        "Filetype",
                        "CursorMoved",
                        "CursorMovedI",
                        "ModeChanged",
                        "RecordingEnter",
                        "RecordingLeave",
                    },
                },
            },
            sections = {
                lualine_a = {
                    "mode",
                },
                lualine_b = { "branch" },
                lualine_c = {
                    "diff",
                    {
                        "diagnostics",
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                    },
                    "filetype",
                    {
                        function()
                            local fidget = require("fidget.notification")
                            local items = fidget.poll_notifications("fidget")
                            if items and #items > 0 then
                                return items[1].message
                            end
                            return ""
                        end,
                        color = { fg = "#ff9e64" },
                    },
                },
                lualine_x = {
                    "searchcount",
                    "venv-selector",
                    "encoding",
                    {
                        "lsp_status",
                        icon = "",
                        symbols = {
                            spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
                            done = "✓",
                            separator = " ",
                        },
                        ignore_lsp = {},
                        show_name = true,
                    },
                },
                lualine_z = { "progress", "location" },
            },
            tabline = {},
            extensions = {},
        })
    end,
}

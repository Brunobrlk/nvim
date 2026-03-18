return {
    "catppuccin/nvim",
    priority = 1000,
    event = "VimEnter",
    config = function()
        require("catppuccin").setup({
            flavour = "auto",
            transparent_background = false, -- disables setting the background color.
            float = {
                transparent = false, -- enable transparent floating windows
                solid = false,     -- use solid styling for floating windows, see |winborder|
            },
            show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
            term_colors = false,   -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false,   -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            no_italic = false,     -- Force no italic
            no_bold = false,       -- Force no bold
            no_underline = false,  -- Force no underline
            styles = {             -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                    ok = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                    ok = { "underline" },
                },
                inlay_hints = {
                    background = true,
                },
            },
            color_overrides = {},
            custom_highlights = function(colors)
                return {
                    BookmarkSign = { fg = colors.sapphire, bg = "NONE", bold = true },
                    BookmarkAnnotationSign = { fg = colors.peach, bg = "NONE", italic = true },

                    -- Fix Telescope transparency & colors
                    TelescopeNormal = { bg = "NONE" },
                    TelescopeBorder = { fg = colors.surface2, bg = "NONE" },
                    TelescopePromptBorder = { fg = colors.surface2, bg = "NONE" },
                    TelescopeResultsBorder = { fg = colors.surface2, bg = "NONE" },
                    TelescopePreviewBorder = { fg = colors.surface2, bg = "NONE" },
                    TelescopePromptNormal = { bg = "NONE" },
                    TelescopeResultsNormal = { bg = "NONE" },
                    TelescopePreviewNormal = { bg = "NONE" },
                    TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
                    TelescopeMatching = { fg = colors.flamingo, bg = "NONE", bold = true },
                    -- Optional: NvimTree highlights for consistency
                    NvimTreeFolderIcon = { fg = colors.blue },
                    NvimTreeFileIcon = { fg = colors.text },
                }
            end,

            default_integrations = true,
            auto_integrations = true,
            -- integrations = {
            --     cmp = true,
            --     gitsigns = true,
            --     nvimtree = true,
            --     notify = false,
            --     mini = {
            --         enabled = true,
            --         indentscope_color = "",
            --     },
            -- },
        })

        vim.cmd.colorscheme("catppuccin-macchiato")
    end,
}

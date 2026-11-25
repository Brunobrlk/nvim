-- ======================
-- FileType
-- ======================
local indent_width = {
    kotlin = 4,
    groovy = 4,
    cs = 4,
    lua = 4,
    python = 4,
}

vim.api.nvim_create_autocmd("FileType", {
    callback = function(event)
        local ft = event.match

        if indent_width[ft] then
            vim.bo[event.buf].shiftwidth = indent_width[ft]
        end

        require("keymaps").setup_language_keymaps(event.buf)
    end,
})

-- ======================
-- Diagnostics
-- ======================
vim.api.nvim_create_user_command("DiagInfo", function()
    vim.diagnostic.open_float({
        source = true,
    })
end, {})

-- ======================
-- VimEnter
-- ======================
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.schedule(function()
            if vim.fn.argc() == 0 then
                require("persistence").load()
            end
        end)
    end,
})

-- ======================
-- User events for plugins
-- ======================
vim.api.nvim_create_autocmd("User", {
    pattern = "PersistenceLoadPost",
    callback = function()
        require("neo-tree.command").execute({
            action = "show",
            source = "filesystem",
            position = "left",
            reveal = true,
            reveal_force_cwd = true, -- change cwd without asking if needed
        })
    end,
})

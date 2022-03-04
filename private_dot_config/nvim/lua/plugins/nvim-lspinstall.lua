local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

local function on_attach(client, bufnr)
    -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
end

local enhance_server_opts = {
    ["sumneko_lua"] = function(opts)
        opts.settings = {
            diagnostics = {
                globals = { "vim" },
            },
            format = {
                enable = false,
            },
            telemetry = {
                enable = false,
            },
        }
    end,
}

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,
    }

    if enhance_server_opts[server.name] then
        -- Enhance the default opts with the server-specific ones
        enhance_server_opts[server.name](opts)
    end

    server:setup(opts)
end)

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

local function on_attach(client, bufnr)
    -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local default_opts = {
        on_attach = on_attach,
    }

    local server_opts = {
        ["sumneko_lua"] = function()
            default_opts.settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            }
        end,
    }

    -- Use the server's custom settings, if they exist, otherwise default to the default options
    local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
    server:setup(server_options)
end)

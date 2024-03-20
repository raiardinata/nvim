return {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  ft = { 'rust' },

  config = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local mason_registry = require 'mason-registry'
    local codelldb = mason_registry.get_package 'codelldb'
    local extension_path = codelldb:get_install_path() .. '/extension/'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path = extension_path .. 'lldb/lib/liblldb'
    local this_os = vim.uv.os_uname().sysname
    local cfg = require 'rustaceanvim.config'

    if this_os:find 'Windows' then
      codelldb_path = extension_path .. 'adapter\\codelldb.exe'
      liblldb_path = extension_path .. 'lldb\\bin\\liblldb.dll'
    else
      -- The liblldb extension is .so for Linux and .dylib for MacOS
      liblldb_path = liblldb_path .. (this_os == 'Linux' and '.so' or '.dylib')
    end

    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {},
      -- LSP configuration
      server = {
        on_attach = function()
          -- you can also put keymaps in here

          vim.keymap.set('n', '<leader>k', function()
            vim.cmd.RustLsp { 'hover', 'actions' }
          end, { buffer = bufnr })

          vim.keymap.set('n', '<leader>a', function()
            vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
            -- or vim.lsp.buf.codeAction() if you don't want grouping.
          end, { silent = true, buffer = bufnr })
        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {},
        },
      },
      -- DAP configuration
      dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
      },
    }
  end,
}

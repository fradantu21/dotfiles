return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local clangd = opts.servers.clangd

      for index, marker in ipairs(clangd.root_markers) do
        if marker == "Makefile" then
          table.remove(clangd.root_markers, index)
          break
        end
      end
      table.insert(clangd.root_markers, 1, "Makefile")

      clangd.before_init = function(params, config)
        local root = config.root_dir
        if not root then
          return
        end

        params.initializationOptions = vim.tbl_deep_extend("force", params.initializationOptions or {}, {
          fallbackFlags = { "-I" .. root, "-I" .. root .. "/include" },
        })
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
      formatters = {
        ["clang-format"] = {
          prepend_args = { "--style={BasedOnStyle: InheritParentConfig, ColumnLimit: 0}" },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "clang-format" } },
  },
}

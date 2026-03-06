if true then return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        emmet_language_server = {},
        cssls = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = function()
      ---@type conform.setupOpts
      local opts = {
        formatters_by_ft = {
          html = { "prettierd" },
          htmlangular = { "prettierd" },
          typescript = { "prettierd" },
          css = { "prettierd" },
        },
      }
      return opts
    end,
  },
} end

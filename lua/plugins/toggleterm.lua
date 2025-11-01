return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    init = function()
      require("lib.utils").keymap.load("toggleterm")
    end,
    opts = {
      highlights = {
        NormalFloat = { link = "TermNormalFloat" },
        FloatBorder = { link = "TermFloatBorder" },
      },
      on_open = function()
        vim.defer_fn(function()
          vim.cmd("startinsert!")
        end, 0)

        -- strip visual noise
        vim.cmd([[
          setlocal nonumber norelativenumber
          setlocal signcolumn=no
        ]])

        -- hide statusline only for this win
        vim.b._tt_prev_laststatus = vim.o.laststatus
        vim.o.laststatus = 0
      end,
      on_close = function(term)
        if vim.b._tt_prev_laststatus ~= nil then
          vim.o.laststatus = vim.b._tt_prev_laststatus
          vim.b._tt_prev_laststatus = nil
        else
          vim.o.laststatus = 3 -- or 2, whatever you use globally
        end
      end,
      float_opts = {
        border = "curved",
      },
    },
  },
}

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
      end,
      float_opts = {
        border = "curved",
      },
    },
  },
}

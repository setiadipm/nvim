return {
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    init = function()
      require("lib.utils").keymap.load("todo")
    end,
    opts = {},
  },
}

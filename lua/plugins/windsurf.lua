return {
  {
    "Exafunction/windsurf.nvim",
    event = "InsertEnter",
    opts = {
      virtual_text = {
        enabled = true,
        key_bindings = {
          accept = "<C-y>",
        },
      },
    },
    config = function(_, opts)
      require("codeium").setup(opts)
    end,
  },
}

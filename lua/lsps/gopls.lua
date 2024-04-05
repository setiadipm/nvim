local opts = {
  settings = {
    gopls = {
      analyses = {
        fieldalignment = false,
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      hints = {
        constantValues = true,
        parametereNames = true,
        rangeVariableTypes = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
    },
  },
}

return opts

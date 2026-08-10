local opts = {
  settings = {
    gopls = {
      analyses = {
        fieldalignment = false,
        nilness = true,
        ST1003 = false, -- poorly chosen identifier (EmployeeId -> EmployeeID)
        ST1000 = false, -- missing package comment
        ST1020 = false, -- exported function should start with the function's name
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

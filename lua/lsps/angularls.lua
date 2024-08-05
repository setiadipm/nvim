local opts = {}

local ok, mason_registry = pcall(require, "mason-registry")
if not ok then
  return opts
end

local angularls_path = mason_registry.get_package("angular-language-server"):get_install_path()

local cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  table.concat({ angularls_path, vim.fn.getcwd() }, ","),
  "--ngProbeLocations",
  table.concat({ angularls_path .. "/node_modules/@angular/language-server", vim.fn.getcwd() }, ","),
}

opts.cmd = cmd

opts.on_new_config = function(new_config)
  new_config.cmd = cmd
end

return opts

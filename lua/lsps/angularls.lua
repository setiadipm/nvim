local opts = {
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local angular_json = vim.fs.find("angular.json", {
      path = fname,
      upward = true,
    })[1]

    if angular_json then
      on_dir(vim.fs.dirname(angular_json))
    end
  end,
}

return opts

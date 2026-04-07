local opts = {
  filetypes = {
    "html",
    "astro",
    "javascriptreact",
    "typescriptreact",
    "vue",
    "svelte",
    "templ",
    "blade",
    "php",
    "heex",
    "erb",
    "twig",
    "markdown",
    "mdx",
  },
  root_dir = function(bufnr, on_dir)
    local util = require("lspconfig.util")
    local fname = vim.api.nvim_buf_get_name(bufnr)

    local root = util.root_pattern(
      "tailwind.config.js",
      "tailwind.config.cjs",
      "tailwind.config.mjs",
      "tailwind.config.ts",
      "postcss.config.js",
      "postcss.config.cjs",
      "postcss.config.mjs",
      "postcss.config.ts"
    )(fname)

    if root then
      on_dir(root)
      return
    end

    local pkg = util.find_package_json_ancestor(fname)
    if pkg then
      local package_json = table.concat(vim.fn.readfile(pkg .. "/package.json"), "\n")
      if package_json:match([["tailwindcss"%s*:]]) then
        on_dir(pkg)
      end
    end
  end,
}

return opts

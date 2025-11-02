return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      -- dashboard.section.header.val = {
      --   "                                                     ",
      --   "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      --   "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      --   "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      --   "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      --   "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      --   "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      --   "                                                     ",
      --   "                      [@setiadipm]                   ",
      -- }
      dashboard.section.header.val = {
        -- [[                                                                       ]],
        -- [[                                                                       ]],
        -- [[                                                                       ]],
        -- [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                             [@setiadipm]                              ]],
      }
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <cr>"),
        dashboard.button("e", " " .. " Open explorer", ":Neotree toggle<cr>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert<cr>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles<cr>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep<cr>"),
        -- dashboard.button("c", " " .. " Config", ":e $MYVIMRC<cr>"),
        -- dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load()<cr>]]),
        dashboard.button("l", " " .. " Lazy", ":Lazy<cr>"),
        dashboard.button("q", " " .. " Quit", ":qa<cr>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 8

      return dashboard
    end,
    config = function(_, dashboard)
      -- Close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

          dashboard.section.footer.val = {
            "",
            "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms",
          }
          pcall(vim.cmd.AlphaRedraw)
        end,
      })

      require("alpha").setup(dashboard.config)
    end,
  },
}

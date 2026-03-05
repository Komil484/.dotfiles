return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- bigfile = { enabled = true },
    explorer = { enabled = true }, -- ?? instead of oil, -- TODO: FIX LAYOUT
    image = { enabled = true }, -- ??
    input = { enabled = true }, -- ???
    notifier = {
      enabled = true,
      timeout = 3000,
    }, -- ?? instead of fidget.nvim
    picker = { enabled = true }, -- ?? instead of telescope
    quickfile = { enabled = true },
    -- words = { enabled = true }, -- ?? ask brother
    -- styles = {
    --   notification = {
    --     -- wo = { wrap = true } -- Wrap notifications
    --   }
    -- }
  },
  keys = {
    -- -- Top Pickers & Explorer
    { "<leader>kf", function() Snacks.picker.smart() end, desc = "Snacks picker: Smart Find Files" },
    { "<leader>kw", function() Snacks.picker.grep() end, desc = "Snacks picker: Grep" },
    { "<leader>kn", function() Snacks.picker.notifications() end, desc = "Snacks picker: Notifications" },
    { "<leader>ke", function() Snacks.picker.explorer() end, desc = "Snacks File Explorer" },
    -- -- find
    { "<leader>km", function() Snacks.picker.keymaps() end, desc = "Snacks picker: Keymaps" },
    -- { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
    -- { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    -- { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
    -- -- LSP
    -- { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    -- { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    -- { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    -- { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    -- { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    -- { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
    -- { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
    --
    -- { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    -- { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    -- { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    -- { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    -- { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" }, -- ????
    -- { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    -- { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    -- { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    -- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
    -- { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    -- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        -- Override print to use snacks for `:=` command
        if vim.fn.has("nvim-0.11") == 1 then
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd 
        end

        -- Create some toggle mappings
        -- Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
      end,
    })
  end,
}

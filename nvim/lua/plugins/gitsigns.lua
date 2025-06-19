return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        
        -- Keymaps
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        
        map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview git hunk" })
        map("n", "<leader>gt", gs.toggle_current_line_blame, { desc = "Toggle git blame" })
        map("n", "<leader>gn", gs.next_hunk, { desc = "Next git hunk" })
        map("n", "<leader>gN", gs.prev_hunk, { desc = "Previous git hunk" })
      end,
    })
  end,
}

--These tables will be merged with the existing mappings table found in astrocore.lua and astrolsp.lua
--
--AstroNvim Add Custom Mappings
--These tables are a direct conversion to the vim.keymap.set({mode}, {lhs}, {rhs}, {opts}) Lua API.
--The first key into the table is the {mode}, the second key into the table is the {lhs}, 
--and the element there is the {opts} table with the {rhs} in the first key. 
--Also AstroLSP supports adding a cond key which can dictate when the mapping should be attached 
--(this is described in detail in the AstroLSP plugin configuration documentation)
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          -- CodeCompanion
          ["<LocalLeader>a"] = { "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle AI Chat"},
          ["<LocalLeader>s"] = { "<cmd>CodeCompanionActions<cr>", desc = "AI Support Actions"},
          ["<C-a>"] = { "<cmd>CodeCompanionActions<cr>", desc = "AI Actions"},
        },
        v = {
          -- CodeCompanion
          ["<LocalLeader>a"] = {"<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle AI Chat"},
          ["<LocalLeader>s"] = { "<cmd>CodeCompanionActions<cr>", desc = "AI Support Actions"},
          ["<C-a>"] = { "<cmd>CodeCompanionActions<cr>", desc = "AI Actions"},
          ["ga"] = { "<cmd>CodeCompanionChat Add<cr>", desc = "Add selected text to AI Chat"}, -- Add visually selected chat to the current chat buffer
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function()
              vim.lsp.buf.hover()
            end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function()
              vim.lsp.buf.declaration()
            end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}

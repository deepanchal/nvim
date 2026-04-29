-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- ["<C-d>"] = { "<C-d>zz", desc = "PgDown Centered" },
        -- ["<C-u>"] = { "<C-u>zz", desc = "PgUp Centered" },
        -- n = { "nzzzv", desc = "Next highlighted centered" },
        -- N = { "Nzzzv", desc = "Prev highlighted centered" },
        J = { "mzJ`z", desc = "Join Line w/ cursor at start" },

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        ["<leader>d"] = {
          [["_d]],
          desc = "Delete to void register",
        },
        ["<leader>y"] = {
          [["+y]],
          desc = "",
        },
        ["<leader>Y"] = {
          [["+Y]],
          desc = "",
        },
        ["<leader>s"] = {
          [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
          desc = "Find & Replace current word",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      v = {
        J = {
          ":m '<-2<CR>gv=gv",
          desc = "Move selection down",
        },
        K = {
          ":m '>+1<CR>gv=gv",
          desc = "Move selection up",
        },
        ["<leader>d"] = {
          [["_d]],
          desc = "Delete to void register",
        },
        ["<leader>y"] = {
          [["+y]],
          desc = "",
        },
      },
      x = {
        -- Greatest remap EVER!!
        -- Let me explain, this remap while in visual mode
        -- will delete what is currently highlighted and replace it
        -- with what is in the register BUT it will YANK (delete) it
        -- to a VOID register. Meaning I still have what I originally had
        -- when I pasted. I don't loose the previous thing I YANKED!
        ["p"] = {
          [["_dP]],
          desc = "Yank & delete highlighted",
        },
      },
      i = {
        ["jk"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
      },
    },
  },
}

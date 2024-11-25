return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        require("neo-tree").setup({
            auto_clean_after_session_restore = true,
            popup_border_style = "rounded",

            default_component_configs = {
                indent = {
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
                modified = {
                    symbol = "󰙏",
                    -- symbol = "󱓻",
                    highlight = "NeoTreeModified",
                },
            },

            source_selector = {
                winbar = true,
                -- statusline = true,
            },

            renderers = {
                file = {
                    { "icon" },
                    { "name", highlight = "NeoTreeFileName" },
                    {
                        "modified",
                        highlight = "NeoTreeFileNameModified",
                    },
                },
            },
        })
    end,
}

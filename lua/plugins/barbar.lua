return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    -- sidebar_filetypes = {
    --     ['neo-tree'] = {event = 'BufWipeOut'},
    -- },
    no_name_title = "Empty",
    icons = {
      -- separator = {left = "", right = ""},
      separator_at_end = false,
      -- preset = 'slanted',
      -- buffer_number = true,
      modified = {button = '󰙏'}
      -- modified = {button = '󱓻'},
    },
    tabpages = true,
    maximum_padding = 1,
    minimum_padding = 1,
  },
}

-- return {
--     'romgrk/barbar.nvim',
--     dependencies = {
--         'lewis6991/gitsigns.nvim',
--         'nvim-tree/nvim-web-devicons',
--     },
--     init = function() vim.g.barbar_auto_setup = false end,
--     opts = {
--         no_name_title = "Empty",
--         icons = {
--             separator_at_end = false,
--             modified = {button = '󱓻'}
--         },
--         tabpages = true,
--     },
--     config = function(_, opts)
--         -- barbar.nvim 설정 적용
--         require('barbar').setup(opts)
--
--         -- barbar.nvim 하이라이트 그룹 가져오기
--         local barbar_hl = vim.api.nvim_get_hl(0, { name = "BufferCurrent" })
--         local barbar_bg = barbar_hl.bg and ("#%06x"):format(barbar_hl.bg)
--         local barbar_fg = barbar_hl.fg and ("#%06x"):format(barbar_hl.fg)
--
--         -- NavicIcons로 시작하는 하이라이트 그룹에 barbar.nvim 색상 동기화
--         local navicHls = {
--             "IconsFile", "IconsModule", "IconsNamespace", "IconsPackage", "IconsClass",
--             "IconsMethod", "IconsProperty", "IconsField", "IconsConstructor", "IconsEnum",
--             "IconsInterface", "IconsFunction", "IconsVariable", "IconsConstant", "IconsString",
--             "IconsNumber", "IconsBoolean", "IconsArray", "IconsObject", "IconsKey", "IconsNull",
--             "IconsEnumMember", "IconsStruct", "IconsEvent", "IconsOperator", "IconsTypeParameter",
--             "Text", "Separator"
--         }
--
--         for _, hlName in ipairs(navicHls) do
--             local fullHlName = "Navic" .. hlName
--             vim.api.nvim_set_hl(0, fullHlName, { fg = barbar_fg, bg = barbar_bg })
--         end
--
--         -- 테마 변경 시 barbar 색상과 NavicIcons를 다시 동기화
--         vim.api.nvim_create_autocmd("ColorScheme", {
--             callback = function()
--                 local barbar_hl = vim.api.nvim_get_hl(0, { name = "BufferCurrent" })
--                 local barbar_bg = barbar_hl.bg and ("#%06x"):format(barbar_hl.bg)
--                 local barbar_fg = barbar_hl.fg and ("#%06x"):format(barbar_hl.fg)
--                 for _, hlName in ipairs(navicHls) do
--                     local fullHlName = "Navic" .. hlName
--                     vim.api.nvim_set_hl(0, fullHlName, { fg = barbar_fg, bg = barbar_bg })
--                 end
--             end,
--         })
--     end,
-- }

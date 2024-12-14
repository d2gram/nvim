vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text" },  -- .md와 .txt 파일 형식에 적용
    callback = function()
        -- Soft wrapping 활성화
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true  -- 단어 단위로 줄바꿈

        -- 파일의 시작 지점으로 이동
        vim.api.nvim_win_set_cursor(0, {1, 0})
    end,
})

vim.api.nvim_create_autocmd("Colorscheme", {
    group = vim.api.nvim_create_augroup('config_custom_highlights', {}),
    callback = function()
        vim.api.nvim_set_hl(0, 'BufferCurrent', { bg = "#292522", bold = true})
        vim.api.nvim_set_hl(0, 'BufferCurrentMod', { fg = "#bd8183", bg = "#292522", bold = true })
        vim.api.nvim_set_hl(0, 'BufferCurrentSign', { bg = "#292522", fg = "#34302c", bold = true })

        vim.api.nvim_set_hl(0, 'BufferInactive', { fg = "#706a66", bg = "#34302c" })
        vim.api.nvim_set_hl(0, 'BufferInactiveMod', { fg = "#8d6163", bg = "#34302c" })
        -- vim.api.nvim_set_hl(0, 'BufferInactiveMod', { fg = "#605a56", bg = "#191511" })
        vim.api.nvim_set_hl(0, 'BufferInactiveSign', { fg = "#292521", bg = "#34302c" })

        vim.api.nvim_set_hl(0, 'BufferVisible', { bg = "#292522" })
        vim.api.nvim_set_hl(0, 'BufferVisibleMod', { fg = "#bd8183", bg = "#292522" })
        vim.api.nvim_set_hl(0, 'BufferVisibleSign', { bg = "#292522", fg = "#34302c" })

        vim.api.nvim_set_hl(0, 'BufferTabpages', { bg = "#34302c", fg = "#34302c",})
        vim.api.nvim_set_hl(0, 'BufferTabpageFill', { bg = "#1c1c1c", fg = "#1c1c1c",})

        -- vim.api.nvim_set_hl(0, 'NeoTreeModified', { fg = "#bd8183" })
        vim.api.nvim_set_hl(0, 'NeoTreeFileNameModified', { fg = "#ece1d7", bold = true })

    end,
})

-- 하이라이트 관련 유틸리티 함수
local function get_default_fg(group)
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    return hl and hl.fg or "#FFFFFF" -- 기본값 설정
end

-- 사용자 정의 네임스페이스 설정
local namespace = vim.api.nvim_create_namespace("custom_theme")

-- 하이라이팅 설정 함수
local function highlight(statement)
    for group, settings in pairs(statement) do
        vim.api.nvim_set_hl(namespace, group, settings) -- 네임스페이스 적용
        vim.api.nvim_set_hl(0, group, settings) -- 전역 적용
    end
end

-- ColorScheme 이벤트에 따라 하이라이트 설정
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        -- Treesitter 기반 하이라이팅 그룹 커스터마이징
        highlight({
            ["@function"] = { fg = get_default_fg("@function"), bold = true, italic = false },
            ["@function.call"] = { fg = '#ffffff', bold = true, italic = false },
            ["@keyword"] = { fg = get_default_fg("@keyword"), italic = true, bold = true },
            ["@keyword.conditional"] = { fg = get_default_fg("@keyword"), italic = true, bold = true },
            ["@keyword.repeat"] = { fg = get_default_fg("@keyword"), italic = true, bold = true },
            ["@keyword.function"] = { fg = get_default_fg("@keyword.function"), italic = true, bold = true },
            ["@keyword.import"] = { fg = get_default_fg("@keyword.function"), italic = true, bold = true },
            ["@string"] = { fg = get_default_fg("@string"), italic = false },
            ["@string.documentation"] = { fg = get_default_fg("@string.special"), italic = false },
            ["@string.escape"] = { fg = "#d3d7ed", italic = false },
            ["@comment"] = { fg = get_default_fg("@comment"), italic = false },
            ["@type.builtin"] = { fg = get_default_fg("@type"), bold = true },
            ["@type.python"] = { fg = get_default_fg("@operator"), bold = true },
            ["@markup.strong"] = { fg = "#ffffff", bold = true },
            ["@markup.italic"] = { fg = "#ffffff", italic = true },
            ["@markup.heading.1"] = { fg = "#d47766", bold = true },
            ["@markup.heading.2"] = { fg = "#e49b5d", bold = true },
            ["@markup.heading.3"] = { fg = "#ebc06d", bold = true },
            ["@markup.heading.4"] = { fg = "#85b695", bold = true },
            ["@markup.heading.5"] = { fg = "#78997a", bold = false },
            ["@markup.heading.6"] = { fg = "#a3a9ce", bold = false },
        })

        -- LSP 기반 하이라이팅 그룹 커스터마이징
        highlight({
            ["@lsp.type.class"] = { fg = get_default_fg("@lsp.type.class"), bold = true },
            ["@lsp.mod.globalscope"] = { italic = false },
            ["@lsp.type.parameter"] = { fg = get_default_fg("@variable"), italic = false },
        })

        -- 기타 하이라이트 설정
        highlight({
            ["Whitespace"] = { fg = "#403a36" },
            ["CursorLine"] = { bg = "#272320"},
            -- ["RenderMarkdownH1Bg"] = { bg = "#4e191b" },
            -- ["RenderMarkdownH2Bg"] = { bg = "#573524" },
            -- ["RenderMarkdownH3Bg"] = { bg = "#5d4e30" },
            -- ["RenderMarkdownH4Bg"] = { bg = "#5d4e30" },
            -- ["RenderMarkdownH5Bg"] = { bg = "#5d4e30" },
            -- ["RenderMarkdownH6Bg"] = { bg = "#5d4e30" },

            ["RenderMarkdownH1Bg"] = { bg = "#292522", underline = true, sp = "#d47766" },
            ["RenderMarkdownH2Bg"] = { bg = "#292522", underline = true, sp = "#e49b5d" },
            ["RenderMarkdownH3Bg"] = { bg = "#292522", underline = true, sp = "#ebc06d" },
            ["RenderMarkdownH4Bg"] = { bg = "#292522", underline = true, sp = "#85b695" },
            ["RenderMarkdownH5Bg"] = { bg = "#292522", underline = true, sp = "#78997a" },
            ["RenderMarkdownH6Bg"] = { bg = "#292522", underline = true, sp = "#a3a9ce" },
            ["RenderMarkdownUnchecked"] = { fg = "#ffffff" },
            ["RenderMarkdownChecked"] = { fg = "#ffffff" },
        })
    end,
})

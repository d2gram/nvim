local M = {}

function M.ToggleTerminal()
    -- 현재 열린 창들 중 터미널을 찾기
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then
            vim.api.nvim_win_close(win, true)  -- 터미널 창이 열려 있으면 닫기
            vim.api.nvim_buf_delete(buf, { force = true })
            return
        end
    end

    -- Neotree가 열린 경우 확인하고, 아래쪽에 터미널 열기
    local neotree_win
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
        if bufname:match("neo%-tree") then
            neotree_win = win
            break
        end
    end

    -- 전체 화면 높이의 1/3를 계산
    local term_height = math.floor(vim.o.lines * 1 / 3)

    -- Neotree가 있으면 우측으로 열리지 않도록 조정하고 아래쪽에 터미널 열기
    if neotree_win then
        vim.cmd("belowright split | resize " .. term_height .. " | terminal")
    else
        vim.cmd("botright split | resize " .. term_height .. " | terminal")
    end
end

return M

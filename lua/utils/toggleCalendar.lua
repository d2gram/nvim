local M = {}

function M.ToggleCalendar()
    -- 모든 창에서 캘린더 창을 찾음
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local bufname = vim.api.nvim_buf_get_name(buf)
        if bufname:sub(-10) == "__Calendar" then
            vim.api.nvim_win_close(win, true) -- 캘린더 창 닫기
            return
        end
    end

    -- 캘린더 창이 없으면 열기
    vim.cmd("Telekasten show_calendar")
end

return M

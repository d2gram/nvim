local M = {} 

-- Neotree 제외한 모든 버퍼를 닫는 함수
function M.closeAll()
    local current_buf = vim.api.nvim_get_current_buf()
    local neotree_buf = nil
    local bufs = vim.api.nvim_list_bufs()

    -- 모든 버퍼를 순회하며 Neotree 버퍼를 찾음
    for _, buf in ipairs(bufs) do
        local buf_name = vim.api.nvim_buf_get_name(buf)
        if buf_name:match("neo%-tree filesystem") then
            neotree_buf = buf
            break
        end
    end

    -- 현재 버퍼가 Neotree인 경우와 아닌 경우 분기 처리
    if neotree_buf then
        if current_buf == neotree_buf then
            -- 현재 버퍼가 Neotree라면, Neotree를 제외한 모든 버퍼를 닫음
            for _, buf in ipairs(bufs) do
                if buf ~= neotree_buf then
                    vim.api.nvim_buf_delete(buf, { force = true })
                end
            end
        else
            -- 현재 버퍼가 Neotree가 아니라면, Neotree와 현재 버퍼를 제외하고 닫음
            for _, buf in ipairs(bufs) do
                if buf ~= neotree_buf and buf ~= current_buf then
                    vim.api.nvim_buf_delete(buf, { force = true })
                end
            end
        end
    else
        -- Neotree가 없다면 현재 버퍼만 남기고 나머지 모두 닫음
        for _, buf in ipairs(bufs) do
            if buf ~= current_buf then
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end
    end
end

return M

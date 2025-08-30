local M = {}

function M.ToggleCheckbox()
  local line = vim.api.nvim_get_current_line() -- 현재 커서가 있는 줄을 가져옴
  local cursor_pos = vim.api.nvim_win_get_cursor(0) -- 현재 커서 위치

  -- 체크박스 토글 로직
  if line:match("^%s*%- %[ %]") then
    -- [ ] 를 [x] 로 변경
    line = line:gsub("%- %[ %]", "- [x]", 1)
  elseif line:match("^%s*%- %[x%]") then
    -- [x] 를 [ ] 로 변경
    line = line:gsub("%- %[x%]", "- [ ]", 1)
  else
    -- 체크박스가 없으면 새 체크박스 추가
    line = "- [ ] " .. line
  end

  -- 줄 업데이트 및 커서 위치 유지
  vim.api.nvim_set_current_line(line)
  vim.api.nvim_win_set_cursor(0, cursor_pos)
end

return M

local M = {}
local api, fn = vim.api, vim.fn
local pending = {}

local function parse_renames(stdout)
  local fields = vim.split(stdout, '\0', { plain = true })
  assert(#fields % 3 == 1 and fields[#fields] == '', 'GitGutter: invalid rename output')
  local renames = {}
  for i = 1, #fields - 1, 3 do
    local status, original, current = fields[i], fields[i + 1], fields[i + 2]
    assert(status:match('^R%d+$') and original ~= '' and current ~= '', 'GitGutter: invalid rename record')
    renames[current] = original
  end
  return renames
end

function M.prepare_base_path(bufnr)
  local path = fn['gitgutter#utility#repo_path'](bufnr, 0)
  if type(path) ~= 'string' or path == '' then
    return false
  end

  local base = fn['gitgutter#utility#get_diff_base'](bufnr)
  local cached = fn['gitgutter#utility#getbufvar'](bufnr, 'basepath')
  if type(cached) == 'string' and vim.startswith(cached, base .. ':') then
    return false
  end

  local name = api.nvim_buf_get_name(bufnr)
  local file = fn.resolve(name)
  if vim.startswith(name, 'fugitive://') then
    file = fn.FugitiveReal(name)
  end
  assert(vim.endswith(file, '/' .. path), 'GitGutter: cannot resolve worktree for ' .. name)
  local worktree = file:sub(1, #file - #path)
  local git = fn['gitgutter#git']()
  local key = table.concat({ worktree, git, base }, '\0')
  local buffer = { name = name, path = path }

  if pending[key] then
    pending[key][bufnr] = buffer
    return true
  end

  local waiters = { [bufnr] = buffer }
  local command = 'exec ' .. git .. ' -c core.safecrlf=false diff --no-relative --diff-filter=R --name-status -z'
  if base ~= '' then
    command = command .. ' ' .. fn['gitgutter#utility#shellescape'](base)
  end
  vim.system({ 'sh', '-c', command .. ' --' }, { cwd = worktree, env = { GIT_OPTIONAL_LOCKS = '0' } },
    vim.schedule_wrap(function(result)
      pending[key] = nil
      if result.code ~= 0 then
        error(('GitGutter: rename scan in %s exited %d\n%s'):format(worktree, result.code, result.stderr))
      end
      local renames = parse_renames(result.stdout)
      for buf, waiting in pairs(waiters) do
        if api.nvim_buf_is_loaded(buf)
          and api.nvim_buf_get_name(buf) == waiting.name
          and fn['gitgutter#utility#repo_path'](buf, 0) == waiting.path
          and fn['gitgutter#utility#get_diff_base'](buf) == base then
          local original = waiting.path
          if renames[waiting.path] then
            original = renames[waiting.path]
          end
          fn['gitgutter#utility#setbufvar'](buf, 'basepath', base .. ':' .. original)
          fn['gitgutter#process_buffer'](buf, 1)
        end
      end
    end))
  pending[key] = waiters
  return true
end

return M

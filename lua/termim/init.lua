local api = vim.api
local popup = require 'nui.popup'
local default_config = require 'termim.config'
local s = require 'termim.store'
local log = require 'termim.log'
local event = require 'nui.utils.autocmd'.event

local M = {}

function M:new(config)
  local c = config or default_config
  local p = popup(c)

  p:mount()

  log.trace("popup mounted: ", p.winid)

  s.insert(p)

  api.nvim_command('terminal')
  api.nvim_command('startinsert')

  p:on(event.TermClose, function()
    vim.schedule(function()
      s.delete(p)
      p:unmount()
    end)
  end)

  p:on(event.BufEnter, function()
    vim.schedule(function()
      api.nvim_command('startinsert')
    end)
  end)
end

function M:open()
  if s.is_empty() then
    log.trace("store is empty, skip open operation")
    return
  end

  local p = s.current()
  log.trace("restoring popup: ", string.format("%p", p))
  p:show()
end

function M:close()
  if s.is_empty() then
    log.trace("store is empty, skip close operation")
    return
  end

  local p = s.current()
  log.trace("closing popup: ", string.format("%p", p))
  p:hide()
end

function M:exit()
  local p = s.current()
  s.delete(p)
  p:unmount()
end

return M

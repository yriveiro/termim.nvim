local a = vim.api
local Popup = require 'nui.popup'
local event = require 'nui.utils.autocmd'.event
local bs = require 'nui.utils.buf_storage'
local default_config = require 'termim.config'

local M = {}

local function float(c)
  local popup = Popup(c)
  popup.hide = function ()
    if popup.popup_state.loading or not popup.popup_state.mounted then
      return
    end

    popup.popup_state.loading = true

    popup.border:unmount()

    if popup.winid then
      if a.nvim_win_is_valid(popup.winid) then
        a.nvim_win_close(popup.winid, true)
      end
      popup.winid = nil
    end

    popup.popup_state.loading = false
    popup.popup_state.mounted = false
  end
  return popup
end

function M.open(config)
  local c = config or default_config
  local popup = float(c)

  popup:mount()

  a.nvim_command('terminal')
  a.nvim_command('startinsert')

  popup:on(event.BufLeave, function()
    vim.schedule(function()
      popup.hide()
      if vim.fn.mode() == "i" then
        a.nvim_command('stopinsert')
      end
    end)
  end)

  popup:on(event.TermClose, function()
    vim.schedule(function()
      popup:unmount()
    end)
  end)

end

return M

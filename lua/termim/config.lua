local config = {
  enter = true,
  focusable = true,
  relative = "editor",
  border = {
    style = "rounded",
    highlight = "FloatBorder",
    text = {
      top = " Termim ",
    },
    padding = {
      top = 0,
      bottom = 0,
      left = 0,
      right = 0,
    },
  },
  position = "50%",
  size = {
    width = "80%",
    height = "60%",
  },
  buf_options = {
    modifiable = true,
    readonly = false,
  },
  win_options = {
    winblend = 0,
    winhighlight = "Normal:Normal",
  },
}

return config

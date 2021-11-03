local config = {
  enter = true,
  focusable = true,
  border = {
    style = "rounded",
    highlight = "FloatBorder",
    text = {
      top = " Termim ",
    },
    padding = {
      top = 1,
      bottom = 1,
      left = 2,
      right = 2,
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

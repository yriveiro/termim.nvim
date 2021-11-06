local config = {
  enter = true,
  focusable = true,
  border = {
    style = "rounded",
    highlight = "FloatBorder",
    text = {
      top = " Termim ",
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

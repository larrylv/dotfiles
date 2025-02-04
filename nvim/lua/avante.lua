require('avante_lib').load()
require('avante').setup{
  provider = 'openai',
  openai = {
    endpoint = 'https://api.openai.com/v1',
    model = 'o1-mini',
  },
  hints = { enabled = false },
  windows = {
    sidebar_header = {
      align = "center", -- left, center, right for title
      rounded = false,
    },
  },
}

require('avante_lib').load()
require('avante').setup{
  hints = { enabled = false },
  provider = 'openai',
  providers = {
    openai = {
      endpoint = 'https://api.openai.com/v1',
      model = 'gpt-5.2',
      external_request_body = {
        reasoning_effort = 'high',
      }
    }
  },
  selection = {
    enabled = false,
    hint_display = "delayed",
  },
  windows = {
    ask = {
      start_insert = false,
    },
    edit = {
      start_insert = false,
    },
    sidebar_header = {
      enabled = false,
      align = "center", -- left, center, right for title
      rounded = false,
    },
  },
}

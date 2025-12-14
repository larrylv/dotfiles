require('avante_lib').load()
require('avante').setup{
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
  hints = { enabled = false },
  windows = {
    sidebar_header = {
      align = "center", -- left, center, right for title
      rounded = false,
    },
  },
}

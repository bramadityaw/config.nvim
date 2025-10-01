local digraph_set = vim.fn.digraph_set

--local Logger = require('logger'):new {}

local M = {}

local default_digraphs = {
  ['\\C'] = 'ℂ',
  ['\\H'] = 'ℍ',
  ['\\N'] = 'ℕ',
  ['\\P'] = 'ℙ',
  ['\\Q'] = 'ℚ',
  ['\\R'] = 'ℝ',
  ['\\Z'] = 'ℤ',
}

---@param opts {backspace: boolean?, digraphs: table?}
function M.setup(opts)
  vim.o.digraph = opts.backspace or false

  local digraphs = opts.digraphs or {}
  for chars, str in pairs(default_digraphs) do
    digraphs[chars] = str
  end

  for chars, str in pairs(digraphs) do
    assert(chars:len() == 2)
    digraph_set(chars, str)
  end
end

return M

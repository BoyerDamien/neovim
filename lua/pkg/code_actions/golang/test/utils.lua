local m = {}
local neotest = require("neotest")

-- Run with summary
local function withSummary(fun, ...)
  m.TestClose()
  fun(...)
  m.TestOpen()
end

-- Run test on the closest function with summary
function m.TestFunc(...)
  withSummary(neotest.run.run, ...)
end

-- Run test on the project with summary
function m.TestFile()
  withSummary(neotest.run.run, vim.fn.expand("%"))
end

-- Run test on the project with summary
function m.TestProject()
  withSummary(neotest.run.run, vim.fn.getcwd())
end

function m.TestOutput()
  neotest.output_panel.open()
end

function m.TestClose()
  neotest.summary.close()
  neotest.output_panel.close()
end

function m.TestOpen()
  neotest.summary.open()
end

return m

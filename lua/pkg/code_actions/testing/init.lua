local nl = require("null-ls")
local test_utils = require("pkg.code_actions.testing.utils")

return {
  name = "testing",
  method = nl.methods.CODE_ACTION,
  filetypes = { "_all" },
  generator = {
    fn = function(params)
      return {
        {
          title = "test function",
          action = function()
            test_utils.TestFunc()
          end
        },
        {
          title = "test project",
          action = function()
            test_utils.TestProject()
          end
        },
        {
          title = "test Output",
          action = function()
            test_utils.TestOutput()
          end
        },
        {
          title = "test files",
          action = function()
            test_utils.TestFile()
          end
        },
      }
    end
  }
}

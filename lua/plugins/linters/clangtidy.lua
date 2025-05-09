local clang_tidy_config = [[
{
  "Checks": "-*,clang-analyzer-*,modernize-*,readability-*,readability-identifier-naming",
  "CheckOptions": [
    { "key": "readability-identifier-naming.FunctionCase", "value": "camelBack" },
    { "key": "readability-identifier-naming.VariableCase", "value": "camelBack" },
    { "key": "readability-identifier-naming.MemberCase", "value": "camelBack" },
    { "key": "readability-identifier-naming.MemberPrefix", "value": "m" },
    { "key": "readability-identifier-naming.ClassCase", "value": "CamelCase" }
  ]
}
]]
return clang_tidy_config

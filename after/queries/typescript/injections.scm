; extends
(call_expression
  function: (member_expression) @_funcName (#match? @_funcName "knex.raw")
  arguments: (arguments (template_string (string_fragment) @injection.content))
  (#set! injection.language "sql")
)
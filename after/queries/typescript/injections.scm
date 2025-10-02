; extends
(call_expression
  function: (member_expression) @_funcName (#match? @_funcName "knex.raw")
  arguments: (arguments (template_string (string_fragment) @injection.content))
  (#set! injection.include-children)
  (#set! injection.language "sql")
)

(call_expression
  function: (identifier) @_funcName (#match? @_funcName "raw")
  arguments: (arguments (template_string (string_fragment) @injection.content))
  (#set! injection.include-children)
  (#set! injection.language "sql")
)

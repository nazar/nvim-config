return {
  'nvim-mini/mini.operators',
  version = '*' ,
  opts = {
    -- conflicts with gr LSP actions - remap gr to cr
    replace = {
      prefix = 'rc'
    }
  }
}

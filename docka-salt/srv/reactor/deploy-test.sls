run_highstate_test:
  cmd.state.highstate:
    - tgt: 'env:test'
    - expr_form: grain

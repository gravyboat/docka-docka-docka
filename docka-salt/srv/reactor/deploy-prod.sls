run_highstate_prod:
  cmd.state.highstate:
    - tgt: 'env:prod'
    - expr_form: grain

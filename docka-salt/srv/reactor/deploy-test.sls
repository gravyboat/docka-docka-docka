def run():
  ret = {}
  ret['deploy'] = {
      'cmd.state.highstate': [
          {tgt': 'G@roles:test'},
      ]
  }
  return ret

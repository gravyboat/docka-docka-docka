def run():
  ret = {}
  ret['deploy'] = {
      'cmd.state.highstate': [
          {tgt': 'G@roles:prod'},
      ]
  }
  return ret

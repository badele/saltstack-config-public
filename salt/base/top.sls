base:
  '*':
    {% if 'ntp.home.loc' not in grains['id'] %}
    - time.ntp.client
    {% endif %}
    - home-tools

  'ntp.home.loc':
    - time.ntp.server

  'elk.home.loc':
    - elk

#  'salt-test.home.loc':
#    - time

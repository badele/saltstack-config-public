# Salt

base:
  '*':
    - time
    - home-tools
    - diamond

  'ntp.home.loc':
    - time

  'dns.home.loc':
    - unbound

#  'elk.home.loc':
#    - elk

  'graphite.home.loc':
    - graphite

  'grafana.home.loc':
    - grafana

  'mqtt.home.loc':
    - mqtt.server
    - mqtt.client


#  # Proxmox
#  'p0*.home.loc':
#    - collectd
#    - collectd.write_graphite

  'test.home.loc':
    - time
    - diamond
    - graphite
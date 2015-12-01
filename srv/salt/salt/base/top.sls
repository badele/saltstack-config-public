# Salt

base:
  '*':
    - time
    - home-tools
    - collectd
    - collectd.write_graphite

  'ntp.home.loc':
    - time

  'dns.home.loc':
    - unbound

  'elk.home.loc':
    - elk

  'influxdb.home.loc':
    - influxdb

  'grafana.home.loc':
    - grafana

#  # Proxmox
#  'p0*.home.loc':
#    - collectd
#    - collectd.write_graphite

  'test.home.loc':
    - time
    - collectd
    - collectd.write_graphite

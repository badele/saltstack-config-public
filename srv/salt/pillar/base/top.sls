# Pillar

base:
  '*':
    - time

  'elk.home.loc':
    - elk

  'dns.home.loc':
    - unbound
    - minion

  'influxdb.home.loc':
    - influxdb

  # Proxmox
  'p0*.home.loc':
    - collectd

  'test.home.loc':
    - collectd

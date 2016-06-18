# Salt

base:
  '*':
    - commons.packages
    - commons.time
    - commons.locale
    - python.v2
    - monitoring.diamond
    - monitoring.omd.agent

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
    - mqtt.mqtt2graphite


#  # Proxmox
#  'p0*.home.loc':
#    - collectd
#    - collectd.write_graphite

  'test.home.loc':
    - time
    - diamond
    - graphite

  'homeassistant.home.loc':
    - rpi.armv7.homeassistant

  # Ubuntu 14.04
  'monitoring.home.loc':
#    - rpi.raspbian.omd
    - monitoring.omd.server
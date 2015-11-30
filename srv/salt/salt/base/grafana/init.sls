{% from "grafana/map.jinja" import grafana with context %}

{% set pkg = "grafana_" + grafana['version'] +"_amd64.deb" %}

grafana_package:
  cmd.run:
    - name: wget -qO /tmp/{{ pkg }} https://grafanarel.s3.amazonaws.com/builds/{{ pkg }}
    - unless: test -f /tmp/{{ pkg }}

libfontconfig:
  pkg.installed

grafana_install:
  pkg.installed:
    - sources:
      - grafana: /tmp/{{ pkg }}
    - require:
      - cmd: grafana_package
    - watch:
      - cmd: grafana_package
    - requires:
      - pkg: libfontconfig


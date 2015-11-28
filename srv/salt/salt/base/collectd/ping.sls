{% from "collectd/map.jinja" import collectd_settings with context %}

include:
  - collectd

liboping0:
  pkg.installed

{{ collectd_settings.plugindirconfig }}/ping.conf:
  file.managed:
    - source: salt://collectd/files/ping.conf
    - user: {{ collectd_settings.user }}
    - group: {{ collectd_settings.group }}
    - mode: 644
    - template: jinja
    - require:
      - pkg: liboping0
    - watch_in:
      - service: collectd-service

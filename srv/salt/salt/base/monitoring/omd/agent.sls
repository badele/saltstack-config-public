# Tested on Ubuntu 14.04

check-mk:
  pkg.installed:
    - pkgs:
        - xinetd
        - check-mk-agent

/etc/xinetd.d/check_mk:
  file.managed:
    - template: jinja
    - source: salt://monitoring/omd/files/check_mk.xinetd
    - mode: 644
    - require:
      - pkg: check-mk

xinetd:
  service.running:
    - restart: True
    - watch:
      - file: /etc/xinetd.d/check_mk

    - require:
      - pkg: check-mk
      - file: /etc/xinetd.d/check_mk
{% from "diamond/map.jinja" import diamond_settings with context %}

# see documentation for buld package https://github.com/python-diamond/Diamond/wiki/Installation
diamond_deb:
  file.managed:
    - name: /tmp/diamond_{{ diamond_settings.version }}_all.deb
    - source: salt://diamond/files/diamond_4.0.332_all.deb
    - user: root
    - group: root
    - mode: 644

requirements_pkg:
  pkg.installed:
    - pkgs:
      - python-support

install_diamond:
  cmd.run:
    - name: dpkg -i /tmp/diamond_{{ diamond_settings.version }}_all.deb
    - unless: ls /usr/bin/diamond
    - require:
      - pkg: requirements_pkg
      - file: diamond_deb

/etc/diamond/diamond.conf:
  file.managed:
    - source: salt://diamond/files/diamond.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644

diamond:
  service.running:
    - enable: True
    - require:
      - cmd: install_diamond
    - watch:
      - file: /etc/diamond/diamond.conf

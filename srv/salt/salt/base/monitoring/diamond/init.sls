# Tested on Ubuntu 14.04

{% from "monitoring/diamond/map.jinja" import diamond_settings with context %}

include:
  - commons

#diamond_uninstalled:
#  pkg.purged:
#    - name: diamond

diamond:
  cmd.run:
    - unless: ls /usr/local/bin/diamond
    - name: 'my_pip2 install git+https://github.com/badele/Diamond.git'
#    - require:
#        - pkg: diamond_uninstalled


/var/log/diamond:
  file.directory:
    - makedirs: true

/etc/diamond/diamond.conf:
  file.managed:
    - source: salt://monitoring/diamond/files/diamond.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644

{% if grains['os_family'] == 'Debian' %}
/etc/init.d/diamond:
  file.managed:
    - source: salt://monitoring/diamond/files/etc/init.d/diamond
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: /etc/init.d/diamond restart
    - require:
      - cmd: diamond
      - file: /etc/diamond/diamond.conf
    - watch:
      - file: /etc/diamond/diamond.conf
{% endif %}
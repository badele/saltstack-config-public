ntp:
  pkg:
    - installed
  service:
    {% if grains['os'] in ['Arch', 'CentOS', 'RedHat'] %}
    - name: ntpd
    {% endif %}
    - running
    - watch:
      - file: /etc/ntp.conf
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://time/files/ntp.conf
    - template: jinja
    - mode: 644
    - require:
      - pkg: ntp
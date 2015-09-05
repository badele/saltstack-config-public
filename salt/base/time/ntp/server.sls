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

/etc/ntp.conf:
  file.managed:
    - source: salt://time/ntp/files/etc/ntp_server.conf
    - template: jinja
    - mode: 644
    - require:
      - pkg: ntp
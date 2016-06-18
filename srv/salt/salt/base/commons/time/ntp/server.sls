include:
  - .commons

/etc/ntp.conf:
  file.managed:
    - source: salt://commons/time/ntp/files/etc/ntp_server.conf
    - template: jinja
    - mode: 644
    - require:
      - pkg: ntp
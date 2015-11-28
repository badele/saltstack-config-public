include:
  - .commons

/etc/ntp.conf:
  file.managed:
    - source: salt://time/ntp/files/etc/ntp_server.conf
    - template: jinja
    - mode: 644
    - require:
      - pkg: ntp
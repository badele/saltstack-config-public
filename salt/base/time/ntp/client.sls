include:
  - home-tools

install_psutil:
  pkg.installed:
    - name: python-psutil
    - require_in:
        - process: ntp

ntp:
  pkg:
    - installed
  process.absent:
    - name: ntpd
  cmd.run: # Fix and bypass the proxmox capability permission
    - name: ntpd -g
    - watch:
      - file: /etc/ntp.conf
    - require:
      - pkg: home-tools

/etc/ntp.conf:
  file.managed:
    - source: salt://time/ntp/files/etc/ntp_client.conf
    - template: jinja
    - mode: 644
    - require:
      - pkg: ntp
include:
  - home-tools

# For salt states process.absent
python-psutil:
  pkg.installed

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
      - pkg: python-psutil
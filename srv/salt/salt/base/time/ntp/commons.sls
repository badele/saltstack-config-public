include:
  - home-tools

# For salt states process.absent
python-psutil:
  pkg.installed

ntp:
  pkg:
    - installed
  cmd.run: # Fix and bypass the proxmox capability permission
    - unless: pidof ntpd
    - name: ntpd -g
    - watch:
      - file: /etc/ntp.conf
    - require:
      - pkg: home-tools-packages
      - pkg: python-psutil
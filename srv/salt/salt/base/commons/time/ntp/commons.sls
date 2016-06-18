include:
  - commons

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
      - pkg: default-commons-packages
      - pkg: python-psutil
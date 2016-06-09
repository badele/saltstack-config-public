# Tested on archlinux (Raspberry PI 2)

alarm:
  user.present:
    - fullname: Homeassistant
    - home: /home/alarm
    - gid_from_name: True
    - groups:
      - uucp

https://github.com/balloob/home-assistant.git:
  git.latest:
    - target: /opt/home-assistant
    - branch: dev

homeassistant:
  cmd.run:
    - unless: less /usr/bin/hass
    - name: script/setup
    - cwd: /opt/home-assistant
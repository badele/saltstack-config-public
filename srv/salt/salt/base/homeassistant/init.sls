# Tested on archlinux (Raspberry PI 2)

#hass:
#  user.present:
#    - fullname: Homeassistant
#    - home: /home/hass
#    - gid_from_name: True

#/opt/hass:
#    file.directory:
#    - user: hass
#    - group: hass
#    - makedirs: True
#    - dir_mode: 755
#    - file_mode: 644
#    - recurse:
#        - user
#        - group
#        - mode

https://github.com/balloob/home-assistant.git:
  git.latest:
    - target: /opt/home-assistant
    - branch: dev

homeassistant:
  cmd.run:
    - unless: less /usr/bin/hass
    - name: script/setup
    - cwd: /opt/home-assistant

#pip3 install --upgrade git+git://github.com/balloob/home-assistant.git@dev

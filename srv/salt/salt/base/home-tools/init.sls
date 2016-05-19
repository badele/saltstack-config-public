home-tools-packages:
  pkg.installed:
    - pkgs:
      - tmux
      - htop
      - mc
      - psmisc # killall
      - python

pip-install:
  cmd.run:
    - unless: ls /usr/bin/pip3
    - name: easy_install pip
    - require:
      - pkg: home-tools-packages
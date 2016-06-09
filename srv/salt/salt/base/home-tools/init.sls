home-tools-packages:
  pkg.installed:
    - pkgs:
      - tmux
      - htop
      - mc
      - psmisc # killall

# Debian section
{% if grains['os_family'] == 'Debian' %}
home-tools-distrib-packages:
  pkg.installed:
    - pkgs:
      - python3
{% endif %}

# Archlinux section
{% if grains['os_family'] == 'Arch' %}
home-tools-distrib-packages:
  pkg.installed:
    - pkgs:
      - python

pip-install:
  cmd.run:
    - unless: ls /usr/bin/pip3
    - name: easy_install pip
    - require:
      - pkg: home-tools-distrib-packages
{% endif %}



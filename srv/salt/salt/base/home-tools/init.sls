packages:
  pkg.installed:
    - pkgs:
      - htop
      - mc
      - psmisc # killall
      - python

pip-install:
  cmd.run:
    - name: easy_install pip
    - require:
      - pkg: packages

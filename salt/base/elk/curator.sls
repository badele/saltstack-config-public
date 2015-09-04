python-pip:
  pkg.installed

elasticsearch-curator:
  pip.installed:
    - require:
      - pkg: python-pip
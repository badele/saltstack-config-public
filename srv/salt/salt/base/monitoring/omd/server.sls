# Tested on Ubuntu 14.04

{% set omdversion="1.30" %}
{% set sitename="home" %}

# Point your browser to {{sitename}}

# Fix omd installation
reinstall-bsdutils:
  cmd.run:
    - unless: ls /usr/bin/logger
    - name: apt-get install --yes --reinstall bsdutils

omd-repository:
    pkgrepo.managed:
        - humanname: Console LABS omd upstream package repository
        - file: /etc/apt/sources.list.d/omd.list
        - name: deb http://labs.consol.de/repo/stable/ubuntu trusty main
        - keyserver: keys.gnupg.net
        - keyid: F8C1CA08A57B9ED7

omd-{{omdversion}}:
  pkg.installed:
    - require:
        - pkgrepo: omd-repository
        - cmd: reinstall-bsdutils

omd create {{sitename}} && omd start {{sitename}}:
  cmd.run:
    - unless: ls /omd/sites/{{sitename}}
    - require:
      - pkg: omd-{{omdversion}}
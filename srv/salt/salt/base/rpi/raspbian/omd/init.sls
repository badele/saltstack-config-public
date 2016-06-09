omd-repository:
    pkgrepo.managed:
        - humanname: OMD armv7 upstream package repository
        - file: /etc/apt/sources.list.d/omd.list
        - name: deb http://dl.bananian.org/packages/ jessie main
        - keyserver: keyserver.ubuntu.com
        - keyid: 24BFF712

omd-1.30:
    pkg.installed:
    - require:
        - pkgrepo: omd-repository

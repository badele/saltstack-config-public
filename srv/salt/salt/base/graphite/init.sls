# Inspired from :
# - https://blog.bearstech.com/2013/01/installer-graphite.html
# - http://abdullahdiaa.com/articles/install-graphite-yosemite/
{% from "graphite/map.jinja" import graphite with context %}

python-dev:
  pkg.installed:
    - pkgs:
      - python-dev
      - python-cairo

graphite-pkg:
  pip.installed:
  - pkgs:
    - django==1.8.3
    - django-tagging==0.4
    - whisper
    - carbon
    - graphite-web
  - require:
    - pkg: python-dev


graphite-group:
  group.present:
    - name: graphite

graphite-user:
  user.present:
    - name: graphite
    - shell: /bin/false
    - groups:
      - graphite
    - require:
      - group: graphite-group

/opt/graphite/conf/storage-schemas.conf:
  file.managed:
    - source: salt://graphite/files/opt/graphite/conf/storage-schemas.conf
    - mode: 644
    - template: jinja
    - require:
      - pip: graphite-pkg

/opt/graphite/conf/carbon.conf:
  file.managed:
    - source: salt://graphite/files/opt/graphite/conf/carbon.conf
    - mode: 644
    - template: jinja
    - require:
      - pip: graphite-pkg

/etc/init.d/carbon:
  file.managed:
    - source: salt://graphite/files/etc/init.d/carbon
    - mode: 755
    - template: jinja
    - require:
      - pip: graphite-pkg
  service.running:
    - name: carbon
    - enable: True
    - require:
      - file: /etc/init.d/carbon
    - sig: carbon-cache.py
    - watch:
      - file: /etc/init.d/carbon

/opt/graphite/webapp/graphite/local_settings.py:
  file.managed:
    - source: salt://graphite/files/opt/graphite/webapp/graphite/local_settings.py
    - mode: 755
    - template: jinja
    - require:
      - pip: graphite-pkg

migrate:
  cmd.run:
    - name: python manage.py migrate
    - cwd: /opt/graphite/webapp/graphite
    - require:
      - file: /opt/graphite/webapp/graphite/local_settings.py
    - watch:
      - file: /opt/graphite/webapp/graphite/local_settings.py


#/opt/graphite/lib/python2.7/site-packages:
#  file.symlink:
#    - target: /usr/lib/pymodules/python2.7/cairo
#    - require:
#      - pip: graphite-pkg

/etc/init.d/graphite:
  file.managed:
    - source: salt://graphite/files/etc/init.d/graphite
    - mode: 755
    - template: jinja
    - require:
      - pip: graphite-pkg
  service.running:
    - name: graphite
    - enable: True
    - require:
      - file: /etc/init.d/graphite
      - cmd: migrate
    - sig: django-admin
    - watch:
      - file: /etc/init.d/graphite



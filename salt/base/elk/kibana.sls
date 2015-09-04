include:
  - nginx

kibana:
  service:
    - running
    - require:
      - pkg: nginx
      - archive: kibana_extract
      - file: /etc/init.d/kibana

kibana_extract:
  archive.extracted:
    - name: /opt
    - source: https://download.elastic.co/kibana/kibana/kibana-{{ salt['pillar.get']('elk:kibanaversion', 'noversion') }}.tar.gz
    - source_hash: sha1={{ salt['pillar.get']('elk:kibanasha1', '') }}
    - tar_options: z
    - archive_format: tar
    - if_missing: /opt/kibana-{{ salt['pillar.get']('elk:kibanaversion', 'noversion') }}

/etc/nginx/sites-available/kibana:
  file:
    - managed
    - template: jinja
    - source: salt://elk/files/etc/nginx/sites-available/kibana
    - watch_in:
        service: nginx

/etc/nginx/sites-enabled/kibana:
  file.symlink:
    - target: /etc/nginx/sites-available/kibana
    - user: root
    - group: root
    - mode: 644
    - watch_in:
        service: nginx
  require:
    - file: /etc/nginx/sites-available/kibana

/etc/init.d/kibana:
  file:
    - managed
    - template: jinja
    - source: salt://elk/files/etc/init.d/kibana
    - user: root
    - group: root
    - mode: 750
logstash_repo:
    pkgrepo.managed:
        - humanname: Logstash Debian repository
        - name: deb http://packages.elasticsearch.org/logstash/{{ salt['pillar.get']('elk:logstashversion', 'noversion') }}/debian stable main
        - dist: stable
        - key_url: https://packages.elastic.co/GPG-KEY-elasticsearch
        - file: /etc/apt/sources.list.d/logstash.list

logstash:
  pkg:
    - installed
  service:
    - running
    - enable: true
    - require:
      - pkg: logstash
    - watch:
      - file: /etc/logstash/conf.d/varlog.conf
      - file: /etc/logstash/conf.d/syslog.conf

/etc/logstash/conf.d/varlog.conf:
  file:
    - managed
    - template: jinja
    - source: salt://elk/files/etc/logstash/conf.d/varlog.conf
    - require:
      - pkg: logstash

/etc/logstash/conf.d/syslog.conf:
  file:
    - managed
    - template: jinja
    - source: salt://elk/files/etc/logstash/conf.d/syslog.conf
    - require:
      - pkg: logstash
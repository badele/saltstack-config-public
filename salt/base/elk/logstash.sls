logstash_repo:
    pkgrepo.managed:
        - humanname: Logstash Debian repository
        - name: deb http://packages.elasticsearch.org/logstash/1.4/debian stable main
        - dist: stable
        - key_url: https://packages.elastic.co/GPG-KEY-elasticsearch
        - file: /etc/apt/sources.list.d/elasticsearch.list

logstash:
  pkg:
    - installed
  service:
    - running
    - enable: true
    - require:
      - pkg: logstash
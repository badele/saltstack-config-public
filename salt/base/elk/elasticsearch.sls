include:
  - java.openjdk


elasticsearch_repo:
    pkgrepo.managed:
        - humanname: Elasticsearch Debian repository
        - name: deb http://packages.elasticsearch.org/elasticsearch/{{ salt['pillar.get']('elk:elasticsearchversion', 'noversion') }}/debian stable main
        - dist: stable
        - key_url: https://packages.elastic.co/GPG-KEY-elasticsearch
        - file: /etc/apt/sources.list.d/elasticsearch.list

elasticsearch:
  pkg.installed:
    - require:
      - pkg: openjdk-7-jre
      - pkgrepo: elasticsearch_repo
  service:
    - running
    - enable: true
    - watch:
      - file: /etc/elasticsearch/elasticsearch.yml
    - require:
      - pkg: elasticsearch

/etc/elasticsearch/elasticsearch.yml:
  file:
    - managed
    - template: jinja
    - source: salt://elk/files/etc/elasticsearch/elasticsearch.yml
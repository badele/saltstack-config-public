{% from "unbound/map.jinja" import unbound with context %}

# Install unbound package & start the service
unbound:
  pkg:
    - latest
  service:
    - running
    - enable: true
    - watch:
      - file: /etc/unbound/unbound.conf
      - file: /etc/unbound/address.conf
    - require:
      - pkg: unbound
      - cmd: unbound-checkconf

# Copy unbound address file
/etc/unbound/address.conf:
  file.managed:
    - source: salt://unbound/files/etc/unbound/address.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: unbound
    - template: jinja

# Copy unbound configuration file
/etc/unbound/unbound.conf:
  file.managed:
    - source: salt://unbound/files/etc/unbound/unbound.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: unbound
      - file: /etc/unbound/root.hints
    - template: jinja
    - require:
      - pkg: unbound
      - file: /etc/unbound/root.hints

# Copy root hints
/etc/unbound/root.hints:
  file.managed:
    - source: salt://unbound/files/etc/unbound/root.hints
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: unbound


# Check is the conf is valid (before restart service)
unbound-checkconf:
  cmd.run:
    - name: unbound-checkconf

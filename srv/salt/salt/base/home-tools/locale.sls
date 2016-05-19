Europe/Paris:
  timezone.system:
    - utc: True

# For archlinux
{% if grains['os_family'] == 'Arch' %}

/etc/locale.gen:
  file.uncomment:
      - regex: fr_FR.UTF-8 UTF-8

locale-gen:
  cmd.run:
    - require:
      - file: /etc/locale.gen

/etc/locale.conf:
  file.managed:
    - source: salt://home-tools/files/etc/locale.conf
    - mode: 644
    - template: jinja
    - require:
      - cmd: locale-gen


# End Archlinux section
{% else %}

fr_locale:
  locale.present:
    - name: fr_FR.UTF-8

default_locale:
  locale.system:
    - name: fr_FR.UTF-8
    - require:
      - locale: fr_locale
{% endif %}

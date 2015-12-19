mosquitto:
  pkg.installed:
    - service.running:
      - enable: true

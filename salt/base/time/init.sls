include:
  {% if salt['pillar.get']("time:ntp:server:servername", "noservername") in grains['id'] %}
  - .ntp.server
  {% else %}
  - .ntp.client
  {% endif %}
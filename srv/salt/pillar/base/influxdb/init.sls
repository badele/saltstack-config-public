influxdb:
  version: 0.9.5.1
  bind-address: 0.0.0.0
  logging:
    directory: /var/log/influxdb
  admin:
    port: 8083
  api:
    port: 8086
  raft:
    port: 8090
  protobuf:
    port: 8099
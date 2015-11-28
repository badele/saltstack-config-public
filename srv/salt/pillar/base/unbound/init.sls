unbound:
    bindaddress : 0.0.0.0
    privateaddress: 192.168.0.0/16
    privatedomain: home.lan
    localdatas:
      - "host1.home.loc.  IN A 10.0.0.1"
      - "host2.home.loc.  IN A 10.0.0.2"
      - "host3.home.loc.  IN A 10.0.0.3"
    localptrs:
      - "10.0.0.1  host1.home.loc"
      - "10.0.0.2  host2.home.loc"
      - "10.0.0.3  host3.home.loc"
    nameservers:
      - "8.8.8.8" # Google Public DNS
      - "74.82.42.42" # Hurricane Electric
      - "4.2.2.4" # Level3 Verizon
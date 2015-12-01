# saltstack-config-public
saltstack-config-public

# Info

I use the **2015.8.0rc3** salt version, i know the latest version work with proxmox 3.4-3, 
but the minion is bugged. You must apply the patch (see misc/fix)

# Contains

    * allcomputers.home.loc (all computers in my local network)
      * ntp client
      * collectd
      * home-tools
        * htop
        * mc
 
    * Proxmox / HP 658553-421 ProLiant MicroServer
      * salt.home.loc (the saltstack master server)
        * commons packages(allcomputers)
        * salt-master
     
      * elk.home.loc (Elasticsearch Logstash Kibana server)
        * commons packages(allcomputers)
        * curator 
     
      * ntp.home.loc (NTP server)
        * commons packages(allcomputers)
        * ntpd
     
      * dns.home.loc (DNS server)
        * commons packages(allcomputers)
        * unbound

      * influxdb.home.loc (DNS server)
        * commons packages(allcomputers)
        * influxdb

    * MikroTik RB750GL Switch
      * gw.home.loc (mikrotik switch/router)
        * local DNS
        * forward log to elk.home.loc:5000 
 
    * Wireless router
      * Openwrt
 
    * French Free box provider
      * ISP
   
# Install

## Master  
    
The salt version working with proxmox 3.4-3 is 2015.8.0rc3
    
    apt-get update
    apt-get install curl git python-ipy
    curl -L https://bootstrap.saltstack.com | sh -s -- -L -M -N -P git v2015.8.0rc3

## Sync the salt formulas

    # Export variables in your .bashrc or .zshrc
    # ./sync_to_master.sh 

## Minion
    
### salt-cloud

Create automatically your infrastructure with this command 
    
    # Create a new computers from cloud.maps.d 
    salt-cloud -m /etc/salt/cloud.maps.d/home.map
    tools/fix/prepare_minion username@hostname

### Manual installation

    # Manual installation from computer
    apt-get install curl
    curl -L https://bootstrap.saltstack.com | sh -s -- -PA ip_salt_master git v2015.8.0rc3
    
### Fix

    # Fix the v2015.8.0rc3 bug
    cd tools/fix/
    ./prepare_minion.sh username@minionip

### Inspired by:
    
    * collectd => https://github.com/saltstack-formulas/collectd-formula
    * influx => https://github.com/seegno/influxdb-formula
    * grafana => https://github.com/666jfox777/saltstack-grafana-formula

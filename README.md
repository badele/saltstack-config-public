# saltstack-config-public
saltstack-config-public

# Info

I use the **2015.8.0rc3** salt version, i know the latest version work with proxmox 3.4-3, 
but the minion is bugged. You must apply the patch (see misc/fix)

# Contains

    * allcomputers.home.loc (all computers in my local network)
      * ntp client
      * diamond
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

      * graphite.home.loc (Carbon & Graphite server)
        * commons packages(allcomputers)
        * graphite

      * grafana.home.loc (grafana)
        * commons packages(allcomputers)
        * grafana
        
      * monitoring.home.loc (OMD)
        * check_mk
          * nagios
          * nagvis

    * MikroTik RB750GL Switch
      * gw.home.loc (mikrotik switch/router)
        * local DNS
        * forward log to elk.home.loc:5000 
 
    * Wireless router
      * Openwrt
 
    * French Free box provider
      * ISP
   
# Install

## Proxmox

### Requirements servers & client

#### Ubuntu openvz template

Download from http://download.openvz.org/template/precreated/ubuntu-14.04-x86_64-minimal.tar.gz and install to  /var/lib/vz/template/cache (proxmox server)

#### Master  
    
    apt-get update
    apt-get install curl git python-ipy apt-transport-https
    curl -L https://bootstrap.saltstack.com | sh -s -- -M -N stable 2015.8

### New instance creation

### Default network configuration

During installation, create venet (routed mode) network interface

### Minion installation

    # Manual installation from computer
    apt-get update
    apt-get install curl apt-transport-https
    curl -L https://bootstrap.saltstack.com | sh -s -- -PA ip_salt_master stable 2015.8

## Sync the salt formulas

    # ./sync_to_master.sh root@x.x.x.x 

## Minion
    
### salt-cloud

Create automatically your infrastructure with this command 
    
    # Create a new computers from cloud.maps.d 
    salt-cloud -m /etc/salt/cloud.maps.d/home.map
    
    # From your github project folder
    cd tools/fix/
    tools/fix/prepare_minion.sh username@hostname

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

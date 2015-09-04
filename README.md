# saltstack-config-public
saltstack-config-public

# Contains

 * **allcomputers.home.loc**(all computers in my local network)
   * ntp client
   * home-tools
     * htop
     * mc
 * **HP 658553-421 ProLiant MicroServer**
   * Proxmox
     * **salt.home.loc**(the saltstack master server)
       * commons packages(allcomputers)
     * **elk.home.loc**(Elasticsearch Logstash Kibana server)
       * commons packages(allcomputers)
       * curator 
 * **MikroTik RB750GL Switch**
   * **gw.home.loc**(mikrotik switch/router)
     * forward log to elk.home.loc:5000  
   
# Install

You can use Rsync to synchonize your salt master plaform

    rsync -avr ROOTPROJECTS/saltstack-config-public username@hostname:/srv/salt
    rsync -avr ROOTPROJECTS/saltstack-config-private/etc/salt username@hostname:/etc/salt


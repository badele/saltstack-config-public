time:
  ntp:
    client:
      servers:
        - ntp.home.loc
    server:
      servername: ntp.home.loc
      restrict: restrict 192.168.0.0 mask 255.255.255.0
      servers:
        - ntp.laas.fr
        - ntp.midway.ovh
        - ntp.unice.fr
        - ntp.accelance.net
        - ntp.ciril.fr
        - ntp.crashdump.fr
        - chronos.espci.fr
        - delphi.phys.univ-tours.fr
        - ntp.deuza.net
        - ntp.ensma.fr
        - ntp.imag.fr
        - ntp1.jussieu.fr
        - 0.fr.pool.ntp.org
        - 1.fr.pool.ntp.org
        - 2.fr.pool.ntp.org
        - 3.fr.pool.ntp.org

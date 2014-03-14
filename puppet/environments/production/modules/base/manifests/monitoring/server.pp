class base::monitoring::server() {

  # Collect all exported monitoring resources
  if $::monitoring_server == $::fqdn {
    Nagios_Host<<| |>> {
      notify => Exec['fix-icinga-conf-permissions'],
    }
    Nagios_Service<<| |>> {
      notify => Exec['fix-icinga-conf-permissions'],
    }
  
    # Purge unneeded resources
    # Bummer, only works with default confdir
    resources { ['nagios_service', 'nagios_host']:
      purge  => true,
      notify => Exec['fix-icinga-conf-permissions'],
    }
  
    exec{'fix-icinga-conf-permissions':
      command => '/bin/chmod 644 /etc/icinga/conf.d/*.cfg',
      refreshonly => true,
      notify => Service['icinga'],
    }

    # We will use the default config of icinga, so no configuration is done through
    # puppet atm
    # Make sure http://packages.icinga.org/epel/6/release/ is an enabled repo in yum
    # You will also need EPEL, but you already have it if you've installed Foreman
    $icinga_packages = [ 'icinga', 'icinga-gui', 'icinga-gui-config', 'nagios-plugins-all' ]
    package{$icinga_packages:
      ensure => installed,
    }

    service{'icinga':
      ensure => running,
      enable => true,
      require => Package['icinga']
    }
  }
}

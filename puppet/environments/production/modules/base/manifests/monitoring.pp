class base::monitoring() {

  @@nagios_host{"nagios_${::hostname}":
    ensure => present,
    address => "$::ipaddress",
    host_name => "$::fqdn",
    check_command => 'check_ping!100.0,20%!500.0,60%',
    display_name => "$::fqdn",
    max_check_attempts => '3',
    use => 'generic-host',
    target => "/etc/icinga/conf.d/service_ssh_${::hostname}.cfg",
  }
   @@nagios_service { "check_ssh_${::hostname}":
   check_command => "check_ssh",
   use => "generic-service",
   host_name => "$fqdn",
   notification_period => "24x7",
   service_description => "SSH",
   target => "/etc/icinga/conf.d/host_${::hostname}.cfg",
   }
}

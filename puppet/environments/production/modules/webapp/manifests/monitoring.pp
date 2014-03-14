class webapp::monitoring() {
   @@nagios_service { "check_webapp_${::hostname}":
   check_command => "check_http",
   use => "generic-service",
   host_name => "$fqdn",
   notification_period => "24x7",
   service_description => "Corporate Webapp",
   target => "/etc/icinga/conf.d/service_webapp_${::hostname}.cfg",
   }
}

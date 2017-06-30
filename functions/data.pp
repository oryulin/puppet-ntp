# Defining data function which replaces the deprecated params.pp file:
function ntp::data {

  $default_variables = {  
    'ntp::package_name'            => 'ntp',
    'ntp::package_ensure'          => 'present',
    'ntp::configuration_name'      => 'ntp.conf',
    'ntp::configuration_file_mode' => '0644',
    'ntp::servers'                 => ['0.centos.pool.ntp.org','1.centos.pool.ntp.org'],
    'ntp::service_ensure'          => 'running',
    'ntp::service_enable'          => true,
    'ntp::service_hasrestart'      => true,
    'ntp::service_hasstatus'       => true,
  }

  $service_name = $facts['os']['family'] ? {
    'Debian' => 'ntp',
    default => 'ntpd',
  }
  
  $service_variables = {
    'ntp::service_name'            => $service_name
  }
  
  $default_variables + $service_variables
}

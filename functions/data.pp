# Defining data function which replaces the deprecated params.pp file:
function ntp::data {

  $base_params = {  
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

  $os_params = $facts['os']['family'] ? {
    'Debian' => { 
      'ntp::service_name'          => 'ntp',
    },
    default => { 
      'ntp::service_name'          => 'ntpd',
    },
  }
  
  notify { "${base_params}": }
  $base_params + $os_params
}

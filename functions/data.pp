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


#  $os_params = $facts['os']['family'] ? {
#    'Debian' => { 
#      'ntp::service_name'          => 'ntp',
#    },
#    default => { 
#      'ntp::service_name'          => 'ntpd',
#    },
#  }

    case $facts['os']['family'] {
    'Debian': {
      $os_params = {
        'ntp::service_name' => 'ntp',
      }
    }
    'RedHat': {
      $os_params = {
        'ntp::service_name' => 'ntpd',
      }
    }
    default: {
      fail("${facts['os']['family']} is not supported!")
    }
  }

  $base_params + $os_params
}

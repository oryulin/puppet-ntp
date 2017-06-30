# Defining data function which replaces the deprecated params.pp file:
function ntp::data {
  
  # Install variables:  
  $package_name = 'ntp'
  $package_ensure = 'present'
  
  # Configuration variables:
  $configuration_name = 'ntp.conf'
  $configuration_file_mode = '0644'
  $servers = ['0.centos.pool.ntp.org','1.centos.pool.ntp.org']
  
  # Service variables:
  $service_ensure = 'running'
  $service_enable = true
  $service_hasrestart = true
  $service_hasstatus = true
  
  $service_name = $facts['os']['family'] ? {
    'Debian' => 'ntp',
    default => 'ntpd',
  }
  
}

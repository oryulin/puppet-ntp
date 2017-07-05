class ntp(
  # Gets this data from either function/data.pp OR hiera
  $package_name,
  $package_ensure,
  $configuration_name,
  $configuration_file_mode,
  $servers,
  $service_ensure,
  $service_name,
  $service_enable,
  $service_hasrestart,
  $service_hasstatus,  
) {
  class { '::ntp::install': }
  class { '::ntp::config': }
  class { '::ntp::service': }

  Class['ntp::install'] -> Class['ntp::config'] ~> Class['ntp::service']
}

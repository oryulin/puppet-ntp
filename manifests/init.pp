class ntp(

  # Install parameters are first:
  $package_name,
  $package_ensure,
  
  # Configuration parameters are next:
  $configuration_name,
  $configuration_file_mode,
  $servers,
  
  # Service parameters are last:
  $service_ensure,
  $service_name,
  $service_enable,
  $service_hasrestart,
  $service_hasstatus,  

) {
  class { '::ntp::install': }
  -> class { '::ntp::config': }
  ~> class { '::ntp::service': }
}

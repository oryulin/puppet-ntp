class ntp(

  # Install parameters are first:
  String $package_name,
  String $package_ensure,
  
  # Configuration parameters are next:
  String $configuration_nam,
  String $configuration_file_mode,
  Array[String] $servers,
  
  # Service parameters are last:
  String $service_ensure,
  String $service_name,
  Boolean $service_enable,
  Boolean $service_hasrestart,
  Boolean $service_hasstatus,  

) {
  class { '::ntp::install': }
  -> class { '::ntp::config': }
  ~> class { '::ntp::service': }
}

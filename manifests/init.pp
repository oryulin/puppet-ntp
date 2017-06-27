class ntp(
  # Install parameters are first:
  String $package_name            = $ntp::params::package_name,
  String $package_ensure          = $ntp::params::package_ensure,
  
  # Configuration parameters are next:
  String $configuration_name      = $ntp::params::configuration_name,
  String $configuration_file_mode = $ntp::params::configuration_file_mode,
  Array[String] $servers          = $ntp::params::servers,
  String $service_ensure          = $ntp::params::service_ensure,
  String $service_name            = $ntp::params::service_name,
  Boolean $service_enable         = $ntp::params::service_enable,
  Boolean $service_hasrestart     = $ntp::params::service_hasrestart,
  Boolean $service_hasstatus      = $ntp::params::service_hasstatus,  
) inherits ::ntp::params {
  class { '::ntp::install': }
  -> class { '::ntp::config': }
  ~> class { '::ntp::service': }
}

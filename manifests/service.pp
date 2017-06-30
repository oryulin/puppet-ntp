class ntp::service(
  String $service_name,
  String $service_ensure,
  Boolean $service_enable,
  Boolean $service_hasstatus,
  Boolean $service_hasrestart,
) {
  service { 'ntp':
    ensure     => $service_ensure,
    enable     => $service_enable,
    name       => $service_name,
    hasstatus  => $service_hasstatus,
    hasrestart => $service_hasrestart,
  }
}

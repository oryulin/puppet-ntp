class ntp::service(
  $service_name,
  $service_ensure,
  $service_enable,
  $service_hasstatus,
  $service_hasrestart,
) {
  service { 'ntp':
    ensure     => $service_ensure,
    enable     => $service_enable,
    name       => $service_name,
    hasstatus  => $service_hasstatus,
    hasrestart => $service_hasrestart,
  }
}

class ntp::install(
  $package_name,
  $package_ensure,
) {
  package { $package_name:
    ensure               => $package_ensure,
  }
}

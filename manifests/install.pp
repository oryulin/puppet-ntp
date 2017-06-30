class ntp::install(
  String $package_name,
  String $package_ensure,
) {
  package { $package_name:
    ensure               => $package_ensure,
  }
}

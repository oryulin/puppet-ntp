class ntp::install inherit ntp{
  package { $package_name:
    ensure               => $package_ensure,
  }
}

class ntp::config(
  $configuration_name,
  $configuration_file_mode,
  $servers,
) {
  file { "/etc/${configuration_name}": 
    ensure                        => file,
    owner                         => 0,
    group                         => 0,
    mode                          => $configuration_file_mode,
    content                       => template("$module_name/ntp.conf.erb"),
  }
}

class ntp::config(
  String $configuration_name      = $ntp::configuration_name,
  String $configuration_file_mode = $ntp::configuration_file_mode,
  Array[String] $servers          = $ntp::servers,
) {
  file { "/etc/${configuration_name}": 
    ensure                        => file,
    owner                         => 0,
    group                         => 0,
    mode                          => $configuration_file_mode,
    content                       => template("$module_name/ntp.conf.erb"),
  }
}

class ntp::config inherits ntp{
  file { "/etc/${configuration_name}": 
    ensure                        => file,
    owner                         => 0,
    group                         => 0,
    mode                          => $configuration_file_mode,
    content                       => template("$module_name/ntp.conf.erb"),
  }
}

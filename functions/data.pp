# Critical Information:
# This data.pp file will only be processed if you include the
# following line at the bottom of your <MODULE>/metadata.json
# file:
#
#   "data_provider": "function"
#
# Note: Ensure the file retains its valid json format.
# Link: https://docs.puppet.com/puppet/4.3/lookup_quick_module.html

function ntp::data {
  $base_params = {  
    'ntp::package_name'            => 'ntp',
    'ntp::package_ensure'          => 'present',
    'ntp::configuration_name'      => 'ntp.conf',
    'ntp::configuration_file_mode' => '0644',
    'ntp::servers'                 => ['0.centos.pool.ntp.org','1.centos.pool.ntp.org'],
    'ntp::service_ensure'          => 'running',
    'ntp::service_enable'          => true,
    'ntp::service_hasrestart'      => true,
    'ntp::service_hasstatus'       => true,
  }

  # Conditional Logic References:
  # Link: https://docs.puppet.com/puppet/5.0/lang_conditional.html

  #----------------------------------------------

  # Using an if statement:
  if $facts['os']['family'] == 'Debian' {
    $os_params = {
      'ntp::service_name' => 'ntp',
    }
  }
  elsif $facts['os']['family'] == 'RedHat' {
    $os_params = {
      'ntp::service_name' => 'ntpd',
    }
  }
  else {
    fail("${facts['os']['family']} is not supported!")
  }
  
  #----------------------------------------------
  
#  # Using a selector statement:
#  $os_params = $facts['os']['family'] ? {
#    'Debian' => { 
#      'ntp::service_name'          => 'ntp',
#    },
#    default => { 
#      'ntp::service_name'          => 'ntpd',
#    },
#  }
  
  #----------------------------------------------
  
#  # Using a case statement:
#    case $facts['os']['family'] {
#    'Debian': {
#      $os_params = {
#        'ntp::service_name' => 'ntp',
#      }
#    }
#    'RedHat': {
#      $os_params = {
#        'ntp::service_name' => 'ntpd',
#      }
#    }
#    default: {
#      fail("${facts['os']['family']} is not supported!")
#    }
#  }

  #----------------------------------------------
  
#  # Using an unless statement:
#  # Assigning the value to a default since unless statements do not access else/elsif statements.
#  # Defaulting to Debian based service name:
#   $os_params = {
#      'ntp::service_name' => 'ntp',
#    }
#  
#  # Works like a negative/reverse if statement. Will only execute if the statement is false:
#  # Using a double negative (unless plus NOT equal) which equates to:
#  # If os family is RedHat it will set service name to ntpd, otherwise will leave it to what its already set. 
#    unless $facts['os']['family'] != 'RedHat' {
#      $os_params = {
#        'ntp::service_name' => 'ntpd',
#      }
#    }
  
  #----------------------------------------------
  
  # Returning the hash values, combined together, as is required for the Puppet Lookup function:
  # Link: https://docs.puppet.com/puppet/4.3/lookup_quick_module.html
  $base_params + $os_params
}

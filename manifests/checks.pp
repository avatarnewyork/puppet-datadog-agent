# Class: datadog::checks
#
# This class provides for custom DataDog checks
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class datadog::checks {

  # is_process_running Check
  file {"/etc/dd-agent/conf.d/is_process_running.yaml":
    ensure   => file,
    content  => template("datadog/is_process_running.yaml.erb"),
    owner    => "dd-agent",
    group    => "root",
    mode     => 0640,
    notify   => Service["datadog-agent"],
    require  => File["/etc/dd-agent"],
  }
  file {"/usr/share/datadog/agent/checks.d/is_process_running.py":
    ensure   => file,
    content  => template("datadog/is_process_running.py.erb"),
    owner    => "dd-agent",
    group    => "root",
    mode     => 0640,
    notify   => Service["datadog-agent"],
    require  => File["/etc/dd-agent"],    
  }

  # tcp_check Check
  file {"/etc/dd-agent/conf.d/tcp_check.yaml":
    ensure   => file,
    content  => template("datadog/tcp_check.yaml.erb"),
    owner    => "dd-agent",
    group    => "root",
    mode     => 0640,
    notify   => Service["datadog-agent"],
    require  => File["/etc/dd-agent"],
  }
  file {"/usr/share/datadog/agent/checks.d/tcp_check.py":
    ensure   => file,
    content  => template("datadog/tcp_check.py.erb"),
    owner    => "dd-agent",
    group    => "root",
    mode     => 0640,
    notify   => Service["datadog-agent"],
    require  => File["/etc/dd-agent"],    
  }  

  # tcp_check Check
  file {"/etc/dd-agent/conf.d/is_mounted.yaml":
    ensure   => file,
    content  => template("datadog/is_mounted.yaml.erb"),
    owner    => "dd-agent",
    group    => "root",
    mode     => 0640,
    notify   => Service["datadog-agent"],
    require  => File["/etc/dd-agent"],
  }
  file {"/usr/share/datadog/agent/checks.d/is_mounted.py":
    ensure   => file,
    content  => template("datadog/is_mounted.py.erb"),
    owner    => "dd-agent",
    group    => "root",
    mode     => 0640,
    notify   => Service["datadog-agent"],
    require  => File["/etc/dd-agent"],
  }  
}

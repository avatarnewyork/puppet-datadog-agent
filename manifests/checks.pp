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
  }
}

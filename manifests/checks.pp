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

#  file {"/usr/share/datadog/agent/checks.d":
#    ensure => directory,
#  }
  
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
  file {"/etc/dd-agent/checks.d/is_process_running.py":
    ensure   => file,
    content  => template("datadog/is_process_running.py.erb"),
    owner    => "dd-agent",
    group    => "root",
    mode     => 0640,
    notify   => Service["datadog-agent"],
    require  => File["/etc/dd-agent"],    
  }
  
  # tcp_check Check
  if size(grep([$description],"/(ftp|sphinx)/")) < 1
  {
    $tcp_ensure = "absent"    
    } else {
    $tcp_ensure = "file"
    }
    
    file {"/etc/dd-agent/conf.d/tcp_check.yaml":
      ensure   => $tcp_ensure,
      content  => template("datadog/tcp_check.yaml.erb"),
      owner    => "dd-agent",
      group    => "root",
      mode     => 0640,
      notify   => Service["datadog-agent"],
      require  => File["/etc/dd-agent"],
    }
  #file {"/etc/dd-agent/checks.d/tcp_check.py":
  #  ensure   => $tcp_ensure,
  #  content  => template("datadog/tcp_check.py.erb"),
  #  owner    => "dd-agent",
  #  group    => "root",
  #  mode     => 0640,
  #  notify   => Service["datadog-agent"],
  #  require  => File["/etc/dd-agent"],    
  #}  

# nfs Check
if size(grep([$description],"nfs")) < 1
{
  $nfs_ensure = "absent"    
  } else {
  $nfs_ensure = "file"
  }
  
  file {"/etc/dd-agent/conf.d/is_mounted.yaml":
    ensure   => $nfs_ensure,
    content  => template("datadog/is_mounted.yaml.erb"),
    owner    => "dd-agent",
    group    => "root",
    mode     => 0640,
    notify   => Service["datadog-agent"],
    require  => File["/etc/dd-agent"],
  }
  file {"/etc/dd-agent/checks.d/is_mounted.py":
    ensure   => $nfs_ensure,
    content  => template("datadog/is_mounted.py.erb"),
    owner    => "dd-agent",
    group    => "root",
    mode     => 0640,
    notify   => Service["datadog-agent"],
    require  => File["/etc/dd-agent"],
  }  

  # ssl_check
  if size(grep([$description],"https")) < 1
  {
    $ssl_ensure = "absent"    
    } else {
    $ssl_ensure = "file"
  }

  file {"/etc/dd-agent/conf.d/ssl_check_expire_days.yaml":
    ensure   => $ssl_ensure,
    content  => template("datadog/ssl_check_expire_days.yaml.erb"),
    owner    => "dd-agent",
    group    => "root",
    mode     => 0640,
    notify   => Service["datadog-agent"],
    require  => File["/etc/dd-agent"],
  }
  file {"/etc/dd-agent/checks.d/ssl_check_expire_days.py":
    ensure   => $ssl_ensure,
    content  => template("datadog/ssl_check_expire_days.py.erb"),
    owner    => "dd-agent",
    group    => "root",
    mode     => 0640,
    notify   => Service["datadog-agent"],
    require  => File["/etc/dd-agent"],
  }

  
  # apache mod_status check
  if size(grep([$description],"http")) < 1
  {
    $http_ensure = "absent"    
    } else {
    $http_ensure = "file"
  }

  file {"/etc/dd-agent/conf.d/apache.yaml":
    ensure   => $http_ensure,
    content  => template("datadog/apache.yaml.erb"),
    owner    => "dd-agent",
    group    => "root",
    mode     => 0640,
    notify   => Service["datadog-agent"],
    require  => File["/etc/dd-agent"],
  }
#file {"/etc/dd-agent/checks.d/apache.py":
#  ensure   => $http_ensure,
#  content  => template("datadog/apache.py.erb"),
#  owner    => "dd-agent",
#  group    => "root",
#  mode     => 0640,
#  notify   => Service["datadog-agent"],
#  require  => File["/etc/dd-agent"],
#}

  # mysql check
if size(grep([$description],"mysql")) < 1
{
  $mysql_ensure = "absent"    
  } else {
  $mysql_ensure = "file"
  }
  
  file {"/etc/dd-agent/conf.d/mysql.yaml":
    ensure   => $mysql_ensure,
    content  => template("datadog/mysql.yaml.erb"),
    owner    => "dd-agent",
    group    => "root",
    mode     => 0640,
    notify   => Service["datadog-agent"],
    require  => File["/etc/dd-agent"],
  }
  # memcache check
  if size(grep([$description],"memcache")) < 1
  {
    $memcache_ensure = "absent"    
    } else {
    $memcache_ensure = "file"
    }
    
    file {"/etc/dd-agent/conf.d/mcache.yaml":
      ensure   => $memcache_ensure,
      content  => template("datadog/mcache.yaml.erb"),
      owner    => "dd-agent",
      group    => "root",
      mode     => 0640,
      notify   => Service["datadog-agent"],
      require  => File["/etc/dd-agent"],
    }
    # varnish check
    if size(grep([$description],"varnish")) < 1
    {
      $varnish_ensure = "absent"    
      } else {
      $varnish_ensure = "file"
      }
      
      file {"/etc/dd-agent/conf.d/varnish.yaml":
        ensure   => $varnish_ensure,
        content  => template("datadog/varnish.yaml.erb"),
        owner    => "dd-agent",
        group    => "root",
        mode     => 0640,
        notify   => Service["datadog-agent"],
        require  => File["/etc/dd-agent"],
      }
      
      # zookeeper check
      if size(grep([$description],"zookeeper")) < 1
      {
        $zookeeper_ensure = "absent"    
        } else {
        $zookeeper_ensure = "file"
        }
        
        file {"/etc/dd-agent/conf.d/zk.yaml":
          ensure   => $zookeeper_ensure,
          content  => template("datadog/zk.yaml.erb"),
          owner    => "dd-agent",
          group    => "root",
          mode     => 0640,
          notify   => Service["datadog-agent"],
          require  => File["/etc/dd-agent"],
        }
}


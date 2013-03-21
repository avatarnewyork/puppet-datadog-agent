# Class: datadog::redhat
#
# This class contains the DataDog agent installation mechanism for Red Hat derivatives
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class datadog::redhat {

  $datadogagent = $::operatingsystemrelease ? {
    /^5/ => 'datadog-agent-base',
    default => 'datadog-agent',
  }
  
    yumrepo {'datadog':
      enabled   => 1,
      gpgcheck  => 0,
      descr     => 'Datadog, Inc.',
      baseurl   => 'http://apt.datadoghq.com/rpm/',
    }

    package { $datadogagent:
      ensure  => latest,
      require => Yumrepo['datadog'],
    }

    service { $datadogagent:
      ensure    => running,
      enable    => true,
      hasstatus => false,
      pattern   => 'dd-agent',
      require   => Package[$datadogagent],
    }

}

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

  $agentname = $::operatingsystemrelease ? {
    /^5/ => 'datadog-agent-base',
    default => 'datadog-agent',
  }
  
    yumrepo {'datadog':
      enabled   => 1,
      gpgcheck  => 0,
      descr     => 'Datadog, Inc.',
      baseurl   => 'http://yum.datadoghq.com/rpm/x86_64/',
    }

    package { 'datadog-agent':
      name    => $agentname,
      ensure  => latest,
      require => Yumrepo['datadog'],
    }

    service { "datadog-agent":
      ensure    => running,
      enable    => true,
      hasstatus => false,
      pattern   => 'dd-agent',
      require   => Package["datadog-agent"],
    }

}

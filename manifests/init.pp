# Class: appmgmt_blog
# ===========================
#
# Full description of class appmgmt_blog here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'appmgmt_blog':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2015 Your name here, unless otherwise noted.
#
application appmgmt_blog (
  $dbuser  = 'wordpress',
  $dbpass  = 'w0rdpr3ss',
  $webpath = '/var/www/wordpress',
  $vhost   = 'wordpress.puppetlabs.demo',
  ) {
    appmgmt_blog::db { $name:
      dbuser => $dbuser,
      dbpass => $dbpass,
      export => Sql[$name],
    }
    appmgmt_blog::web { $name:
      webpath => $webpath,
      consume => Sql[$name],
      vhost   => $vhost,
    }
}

# Class: gitswarm
# ===========================
#
# Configures Perforce Gitswarm
#
# Authors
# -------
#
# Alan Petersen <alan@jthought.com>
#
# Copyright
# ---------
#
# Copyright 2015 Alan Petersen, unless otherwise noted.
#
class gitswarm {

  case $::osfamily {
    'redhat': {
      include gitswarm::redhat
    }
    'debian': {
      include gitswarm::debian
    }
    default: {
      fail("Sorry, ${::osfamily} is not currently suppported by the gitswarm module")
    }
  }

}

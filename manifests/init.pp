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

  $p4_key_version = '0ff18869'
  $p4_key_release = '520eab5e'
  exec {'import_perforce_pubkey':
    command => 'rpm --import https://package.perforce.com/perforce.pubkey',
    path    => '/bin',
    unless  => "rpm -qi gpg-pubkey-${p4_key_version}-${p4_key_release}",
    before  => Yumrepo['perforce'],
  }

  yumrepo { 'perforce':
    baseurl  => "http://package.perforce.com/yum/rhel/${::operatingsystemmajrelease}/x86_64",
    descr    => 'Perforce Repo',
    enabled  => '1',
    gpgcheck => '1',
  }

  package { 'helix-gitswarm':
    ensure  => installed,
    require => Yumrepo['perforce'],
  }

}

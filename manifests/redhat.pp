#
class gitswarm::redhat (
  $pkgname            = $gitswarm::params::pkgname,
  $pubkey_url         = $gitswarm::params::pubkey_url,
  $yum_baseurl        = $gitswarm::params::yum_baseurl,
  $perforce_repo_name = $gitswarm::params::perforce_repo_name,
) inherits gitswarm::params {

  yumrepo { $perforce_repo_name:
    baseurl  => $yum_baseurl,
    descr    => 'Perforce Repo',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => $pubkey_url,
  }

  package { $pkgname:
    ensure  => installed,
    require => Yumrepo[$perforce_repo_name],
  }

}

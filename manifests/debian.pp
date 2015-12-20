#
class gitswarm::debian (
  $pkgname               = $gitswarm::params::pkgname,
  $pubkey_url            = $gitswarm::params::pubkey_url,
  $p4_key_fingerprint    = $gitswarm::params::p4_key_fingerprint,
  $p4_distro_location    = $gitswarm::params::p4_distro_location,
  $p4_distro_release     = $gitswarm::params::p4_distro_release,
) inherits gitswarm::params {

  include apt

  apt::key { 'perforce-key':
    ensure  => present,
    id      => $p4_key_fingerprint,
    source  => $pubkey_url,
  }

  apt::source { 'perforce-apt-config':
    comment  => 'This is the Perforce debian distribution configuration file',
    location => $p4_distro_location,
    release  => $p4_distro_release,
    repos => 'release',
    include  => {
      'src' => false,
      'deb' => true,
    },
    require => Apt::Key['perforce-key'],
  }

  package { $pkgname:
    ensure  => installed,
    require => Apt::Source['perforce-apt-config'],
  }

}

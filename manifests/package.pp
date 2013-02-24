class scala::package {
  include wget

  wget::fetch { 'download-typesafe-repo':
    source      => 'http://apt.typesafe.com/repo-deb-build-0002.deb',
    destination => '/usr/local/src/repo-deb-build-0002.deb',
    before      => Package['typesafe_repo'],
  }

  package { 'typesafe-repo':
    ensure   => installed,
    source   => '/usr/local/src/repo-deb-build-0002.deb',
    provider => dpkg,
    notify   => Exec['apt-update-typesafe'];
  }

  exec { 'apt-update-typesafe':
    command     => '/usr/bin/apt-get update',
    refreshonly => true;
  }

  package { [
    'typesafe-stack',
    'scala',
  ]:
    ensure  => installed,
    require => Exec['apt-update-typesafe'],
  }

}

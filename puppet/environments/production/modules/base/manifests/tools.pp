class base::tools() {

  if $osfamily == 'RedHat' {
    # Cleanup all local repositories as they are not needed
    # Mattias Giese, giese@b1-systems.de
    file{'local-yum-repos':
      path => '/etc/yum.repos.d',
      ensure => directory,
      recurse => true,
      purge => true,
    }
    File['local-yum-repos'] -> Package<| |>
  }
  package{'screen':
    ensure => present,
  }
  class{'ssh::server':
    storeconfigs_enabled => false,
  }

}

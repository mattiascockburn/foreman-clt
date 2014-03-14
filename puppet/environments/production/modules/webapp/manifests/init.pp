class webapp() {

  # super simple example to demonstrate puppet
  # Mattias Giese, giese@b1-systems.de
  file {'/var/www/html/index.html':
    ensure => present,
    content => template('webapp/index.erb'),
  }

  # activate monitoring
  include webapp::monitoring
}

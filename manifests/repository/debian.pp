# == Class riak::repository::debian
#
# Install the correct package repository for Debian
#
class riak::repository::debian {
  ensure_packages('apt-transport-https') # packagecloud is https-only
  include ::apt
  apt::source { 'riak':
    location   => 'https://packagecloud.io/basho/riak/debian/',
    key        => '418A7F2FB0E1E6E7EABF6FE8C2E73424D59097AB',
    pin        => '550',
    repos      => 'main',
#    release    => $::lsbdistcodename,
    release    => 'wheezy',
    before     => Package[$::riak::package_name],
    require    => Package['apt-transport-https'],
  }
}

# == Class riak::install
#
# This class is called from riak for install.
#
class riak::install (
  $manage_package = $::riak::manage_package,
  $package_name   = $::riak::package_name,
  $version        = $::riak::version,
) {

  if ($manage_package) {
    ensure_packages(['sudo'])
    package { $package_name:
      ensure => $version,
    }
  }
}

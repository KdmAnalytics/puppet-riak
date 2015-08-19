# == Class: riak
#
# Deploy and manage Riak.
#
class riak (
  $package_name        = $::riak::params::package_name,
  $service_name        = $::riak::params::service_name,
  $manage_package      = $::riak::params::manage_package,
  $manage_repo         = $::riak::params::manage_repo,
  $version             = $::riak::params::version,
  $ulimits_nofile_soft = $::riak::params::ulimits_nofile_soft,
  $ulimits_nofile_hard = $::riak::params::ulimits_nofile_hard,
  $settings            = {},
) inherits ::riak::params {

  class { '::riak::repository': } ->
  class { '::riak::install':    } ->
  class { '::riak::config':     } ~>
  class { '::riak::service':    } ->
  Class['riak']
}

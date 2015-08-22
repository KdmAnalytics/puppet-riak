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

  contain '::riak::repository'
  contain '::riak::install'
  contain '::riak::config'
  contain '::riak::service'

  Class ['::riak::repository'] ->
  Class ['::riak::install'] ->
  Class ['::riak::config'] ~>
  Class ['::riak::service']
}

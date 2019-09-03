# == Class: go_carbon::install
#
# This class handles the installation of the go-carbon.
#
#
class go_carbon::install {

  $package_name            = $go_carbon::globals::package_name
  $version                 = $go_carbon::globals::version
  $package_release         = $go_carbon::globals::package_release
  $package_url             = $go_carbon::globals::package_url
  $arch                    = $facts['os']['architecture']

  $manage_package          = $go_carbon::manage_package
  $download_package        = $go_carbon::download_package

  if $download_package {
    $package_source   = inline_template($package_url)
    $package_provider = $go_carbon::globals::package_provider
  } else {
    $package_source   = undef
    $package_provider = undef
  }

  if $manage_package {
    package { $package_name :
      ensure   => installed,
      provider => $package_provider,
      source   => $package_source,
    }
  }

}

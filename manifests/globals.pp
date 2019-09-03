# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include go_carbon::globals
#
class go_carbon::globals(
  String                       $package_name,
  String                       $package_url,
  String                       $package_provider,
  Pattern[/^\d+(\.\d+){2}$/]   $version,
  Stdlib::Absolutepath         $conf_dir,
  Stdlib::Absolutepath         $log_dir,
  Optional[Integer[1]]         $package_release   = undef,
  Optional[String]             $user              = undef,
  Optional[String]             $group             = undef,
) {

}

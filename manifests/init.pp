# == class: go_carbon
#
# This module installs and configures Go-Carbon.
#
# === Parameters
#

class go_carbon(
  #Enum['running', 'stopped'] $ensure                                   = running,
  Stdlib::Ensure::Service    $ensure                                   = running,
  Boolean                    $enable                                   = true,
  Boolean                    $download_package                         = false,
  Boolean                    $manage_package                           = true,

  #[go-carbon.conf]
  #[common]
  String                     $graph_prefix                             = 'carbon.agents.{host}',
  String                     $metric_endpoint                          = 'local',
  String                     $metric_interval                          = '1m0s',
  Integer                    $max_cpu                                  = 4,
  #[whisper]
  Stdlib::Absolutepath       $whisper_data_dir                         = '/var/lib/graphite/whisper',
  Stdlib::Absolutepath       $whisper_schemas_file                     = '/etc/go-carbon/storage-schemas.conf',
  Stdlib::Absolutepath       $whisper_aggregation_file                 = '/etc/go-carbon/storage-aggregation.conf',
  Integer                    $whisper_workers                          = 8,
  Integer                    $whisper_max_updates_per_second           = 0,
  Integer                    $whisper_max_creates_per_second           = 0,
  Boolean                    $whisper_hard_max_creates_per_second      = false,
  Boolean                    $whisper_sparse_create                    = false,
  Boolean                    $whisper_flock                            = false,
  Boolean                    $whisper_flock_enabled                    = true,
  Boolean                    $whisper_hash_filenames                   = true,
  #[cache]
  Integer                    $cache_max_size                           = 1000000,
  String                     $cache_write_strategy                     = 'max',
  #[udp]
  Boolean                    $udp_enabled                              = true,
  String                     $udp_port                                 = ':2003',
  Integer                    $udp_buffer_size                          = 0,
  #[tcp]
  Boolean                    $tcp_enabled                              = true,
  String                     $tcp_port                                 = ':2003',
  Integer                    $tcp_buffer_size                          = 0,
  #[pickle]
  Boolean                    $pickle_enabled                           = true,
  String                     $pickle_port                              = ':2004',
  Integer                    $pickle_max_message_size                  = 67108864,
  Integer                    $pickle_buffer_size                       = 0,
  #[carbonlink]
  Boolean                    $carbonlink_enabled                       = true,
  String                     $carbonlink_listen                        = '127.0.0.1:7002',
  String                     $carbonlink_read_timeout                  = '30s',
  #[grpc]
  Boolean                    $grpc_enabled                             = true,
  String                     $grpc_listen                              = '127.0.0.1:7003',
  #[tags]
  Boolean                    $tags_enabled                             = true,
  String                     $tagdb_url                                = 'http://127.0.0.1:8000',
  Integer                    $tagdb_chunk_size                         = 32,
  Integer                    $tagdb_update_interval                    = 100,
  Stdlib::Absolutepath       $tagdb_local_dir                          = '/var/lib/graphite/tagging/',
  String                     $tagdb_timeout                            = '1s',
  #[carbonserver]
  String                     $carbonserver_listen                      = '127.0.0.1:8080',
  Boolean                    $carbonserver_enabled                     = true,
  Integer                    $carbonserver_buckets                     = 10,
  Boolean                    $carnonserver_metrics_as_counters         = false,
  String                     $carbonserver_read_timeout                = '60s',
  String                     $carbonserver_write_timeout               = '60s',
  Boolean                    $carbonserver_query_cache_enabled         = true,
  Integer                    $carbonserver_query_cache_size_mb         = 0,
  Boolean                    $carbonserver_find_cache_enabled          = true,
  Boolean                    $carbonserver_trigram_index               = true,
  String                     $carbonserver_scan_frequency              = '5m0s',
  Integer                    $carbonserver_max_globs                   = 100,
  Boolean                    $carbonserver_fail_on_max_globs           = false,
  Boolean                    $carbonserver_graphite_web_10_strict_mode = true,
  String                     $carbonserver_internal_stats_dir          = '',
  Array[Integer, 5]          $carbonserver_stats_percentiles           = [99, 98, 95, 75, 50],
  #[dump]
  Boolean                    $dump_enabled                             = false,
  Stdlib::Absolutepath       $dump_path                                = '/var/lib/graphite/dump/',
  Integer                    $dump_restore_per_second                  = 0,
  #[pprof]
  String                     $pprof_listen                             = 'localhost:7007',
  Boolean                    $pprof_enabled                            = false,
  #[logging]
  String                     $logging_logger                           = '',
  Stdlib::Absolutepath       $logging_file                             = '/var/log/go-carbon/go-carbon.log',
  String                     $logging_level                            = 'info',
  String                     $logging_encoding                         = 'mixed',
  String                     $logging_encoding_time                    = 'iso8601',
  String                     $logging_duration                         = 'seconds',

  ##[storage-schemas.conf]
  #Array                      $storage_schemas                          = [
  #                             {
  #                               name       => 'default',
  #                               pattern    => '.*',
  #                               retentions => '60s:30d,1h:5y'
  #                             },
  #                           ],

  #[storage-aggregation.conf]
  Array                      $storage_aggreation                       = [
                               name             => 'default',
                               pattern          => '.*',
                               xfilesfactor     => '0.5',
                               aggreationmethod => 'average'
                             ]
  ){

  require ::go_carbon::globals

  Class['go_carbon::install']
    -> Class['go_carbon::config']
    ~> Class['go_carbon::service']

  contain ::go_carbon::install
  contain ::go_carbon::config
  contain ::go_carbon::service
}

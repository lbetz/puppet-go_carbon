# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include go_carbon::config
class go_carbon::config {

  $user                                     = $go_carbon::globals::user
  $conf_dir                                 = $go_carbon::globals::conf_dir
  #$graph_prefix                             = $go_carbon::init::graph_prefix
  #$metric_endpoint                          = $go_carbon::init::metric_endpoint
  #$metric_interval                          = $go_carbon::init::metric_interval
  #$max_cpu                                  = $go_carbon::init::max_cpu
  #$whisper_data_dir                         = $go_carbon::init::whisper_data_dir
  #$whisper_schemas_file                     = $go_carbon::init::whisper_schemas_file
  #$whisper_aggregation_file                 = $go_carbon::init::whisper_aggregation_file
  #$whisper_workers                          = $go_carbon::init::whisper_workers
  #$whisper_max_updates_per_second           = $go_carbon::init::whisper_max_updates_per_second
  #$whisper_max_creates_per_second           = $go_carbon::init::whisper_max_creates_per_second
  #$whisper_hard_max_creates_per_second      = $go_carbon::init::whisper_hard_max_creates_per_second
  #$whisper_sparse_create                    = $go_carbon::init::whisper_sparse_create
  #$whisper_flock                            = $go_carbon::init::whisper_flock
  #$whisper_flock_enabled                    = $go_carbon::init::whisper_flock_enabled
  #$whisper_hash_filenames                   = $go_carbon::init::whisper_hash_filenames
  #$cache_max_size                           = $go_carbon::init::cache_max_size
  #$cache_write_strategy                     = $go_carbon::init::cache_write_strategy
  #$udp_enabled                              = $go_carbon::init::udp_enabled
  #$udp_port                                 = $go_carbon::init::udp_port
  #$udp_buffer_size                          = $go_carbon::init::udp_buffer_size
  #$tcp_enabled                              = $go_carbon::init::tcp_enabled
  #$tcp_port                                 = $go_carbon::init::tcp_port
  #$tcp_buffer_size                          = $go_carbon::init::tcp_buffer_size
  #$pickle_enabled                           = $go_carbon::init::pickle_enabled
  #$pickle_port                              = $go_carbon::init::pickle_port
  #$pickle_max_message_size                  = $go_carbon::init::pickle_max_message_size
  #$pickle_buffer_size                       = $go_carbon::init::pickle_buffer_size
  #$carbonlink_enabled                       = $go_carbon::init::carbonlink_enabled
  #$carbonlink_listen                        = $go_carbon::init::carbonlink_listen
  #$carbonlink_read_timeout                  = $go_carbon::init::carbonlink_read_timeout
  #$grpc_enabled                             = $go_carbon::init::grpc_enabled
  #$grpc_listen                              = $go_carbon::init::grpc_listen
  #$tags_enabled                             = $go_carbon::init::tags_enabled
  #$tagdb_url                                = $go_carbon::init::tagdb_url
  #$tagdb_chunk_size                         = $go_carbon::init::tagdb_chunk_size
  #$tagdb_update_interval                    = $go_carbon::init::tagdb_update_interval
  #$tagdb_local_dir                          = $go_carbon::init::tagdb_local_dir
  #$tagdb_timeout                            = $go_carbon::init::tagdb_timeout
  #$carbonserver_listen                      = $go_carbon::init::carbonserver_listen
  #$carbonserver_enabled                     = $go_carbon::init::carbonserver_enabled
  #$carbonserver_buckets                     = $go_carbon::init::carbonserver_buckets
  #$carnonserver_metrics_as_counters         = $go_carbon::init::carnonserver_metrics_as_counters
  #$carbonserver_read_timeout                = $go_carbon::init::carbonserver_read_timeout
  #$carbonserver_write_timeout               = $go_carbon::init::carbonserver_write_timeout
  #$carbonserver_query_cache_enabled         = $go_carbon::init::carbonserver_query_cache_enabled
  #$carbonserver_query_cache_size_mb         = $go_carbon::init::carbonserver_query_cache_size_mb
  #$carbonserver_find_cache_enabled          = $go_carbon::init::carbonserver_find_cache_enabled
  #$carbonserver_trigram_index               = $go_carbon::init::carbonserver_trigram_index
  #$carbonserver_scan_frequency              = $go_carbon::init::carbonserver_scan_frequency
  #$carbonserver_max_globs                   = $go_carbon::init::carbonserver_max_globs
  #$carbonserver_fail_on_max_globs           = $go_carbon::init::carbonserver_fail_on_max_globs
  #$carbonserver_graphite_web_10_strict_mode = $go_carbon::init::carbonserver_graphite_web_10_strict_mode
  #$carbonserver_internal_stats_dir          = $go_carbon::init::carbonserver_internal_stats_dir
  #$carbonserver_stats_percentiles           = $go_carbon::init::carbonserver_stats_percentiles
  #$dump_enabled                             = $go_carbon::init::dump_enabled
  #$dump_path                                = $go_carbon::init::dump_path
  #$dump_restore_per_second                  = $go_carbon::init::dump_restore_per_second
  #$pprof_listen                             = $go_carbon::init::pprof_listen
  #$pprof_enabled                            = $go_carbon::init::pprof_enabled
  #$logging_logger                           = $go_carbon::init::logging_logger
  #$logging_file                             = $go_carbon::init::logging_file
  #$logging_level                            = $go_carbon::init::logging_level
  #$logging_encoding                         = $go_carbon::init::logging_encoding
  #$logging_encoding_time                    = $go_carbon::init::logging_encoding_time
  #$logging_duration                         = $go_carbon::init::logging_duration

  file { "${conf_dir}/go-carbon.conf":
    ensure  => file,
    content => template('go_carbon/go-carbon.conf.erb')
  }

  file { "${conf_dir}/storage-aggregation.conf":
    ensure  => file,
    content => template('go_carbon/storage-aggregation.conf.erb')
  }

  #file { "${conf_dir}/storage-schemas.conf":
  #  ensure  => file,
  #  content => template('go_carbon/storage-schemas.conf.erb')
  #}
}

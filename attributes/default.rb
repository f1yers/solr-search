normal['java']['jdk_version'] = '7'
normal['java']['install_flavor'] = 'oracle'
normal['java']['oracle']['accept_oracle_download_terms'] = true

normal['appdynamics']['java_agent']['version'] = 'latest'
normal['appdynamics']['tier_name'] = 'search-solr'
normal['appdynamics']['node_name'] = 'search-solr-shard'
#override app_name in scalr with appropriate environment
normal['appdynamics']['app_name'] = nil
normal['appdynamics']['controller']['user'] = 'gannett'
normal['appdynamics']['controller']['accesskey'] = 'coeox4o0z5l9'
normal['appdynamics']['controller']['host'] = 'gannett.saas.appdynamics.com'
normal['appdynamics']['controller']['port'] = 443
normal['appdynamics']['controller']['ssl'] = true

normal['solr']['version'] = '5.2.1'
normal['solr']['checksum'] = '3f54cec862da1376857f96f4a6f2044a5addcebc4df159b8797fd71f7ba8df86'
normal['solr']['url'] = "https://archive.apache.org/dist/lucene/solr/#{node['solr']['version']}/solr-#{node['solr']['version']}.tgz"
normal['solr']['zookeeper'] = true
normal['solr']['user'] = 'solr'
normal['solr']['group'] = 'solr'
normal['solr']['install_examples'] = false
normal['solr']['log_dir'] = '/opt/solr/server/logs'
normal['solr']['log_file'] = '/opt/solr/server/logs/solr.log'
normal['solr']['data_dir'] = '/opt/solr/server'
normal['solr']['java_options'] = '-m 1g -Djava.awt.headless=true -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=7199'
normal['solr']['computed_java_options'] = "%{zkoptions} #{node['solr']['java_options']}"
normal['solr']['appdynamics_enabled'] = false
#override exhibitor_url in scalr
normal['solr']['exhibitor_url'] = '192.168.10.120'
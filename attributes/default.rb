normal['java']['jdk_version'] = '7'
normal['java']['install_flavor'] = 'oracle'
normal['java']['oracle']['accept_oracle_download_terms'] = true

normal['python']['version'] = '2.7.9-1.el6.gd'
normal['python']['install_method'] = 'custom-package'

normal['appdynamics']['java_agent']['version'] = 'latest'
normal['appdynamics']['tier_name'] = 'search-solr'
normal['appdynamics']['node_name'] = 'search-solr-shard'
# override app_name in scalr with appropriate environment
default['appdynamics']['app_name'] = nil
normal['appdynamics']['controller']['user'] = 'gannett'
normal['appdynamics']['controller']['accesskey'] = 'coeox4o0z5l9'
normal['appdynamics']['controller']['host'] = 'gannett.saas.appdynamics.com'
normal['appdynamics']['controller']['port'] = 443
normal['appdynamics']['controller']['ssl'] = true

normal['splunk']['client-name']['production'] = 'GD-GDP-PRD-APPSVC-SOLR-LX'
normal['splunk']['client-name']['staging'] = 'GD-GDP-STG-APPSVC-SOLR-LX'
normal['splunk']['client-name']['development'] = 'GD-GDP-DEV-APPSVC-SOLR-LX'

normal['datadog']['solr']['instances'] = [
  {
    'server' => 'localhost',
    'port' => '7199'
  }
]
normal['datadog']['api_key'] = '8811f4162b1cc39f60b0a297b88fedfa'
normal['datadog']['application_key'] = '6cbe3ea48bfb727caa696f7a93bf1542e4cc39b2'

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
# override heapsize/java opts as needed in scalr
default['solr']['heapsize'] = '1g'
default['solr']['java_options'] = '-Djava.awt.headless=true -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=7199'
normal['solr']['computed_java_options'] = "%{zkoptions} -m #{node['solr']['heapsize']} #{node['solr']['java_options']}"
default['solr']['appdynamics_enabled'] = false
# override required in scalr
default['solr']['exhibitor_url'] = nil

name 'solr-search'
maintainer 'Gannett'
maintainer_email 'PaaS-Optimization@gannett.com'
license 'All rights reserved'
description 'Installs and configures Solr 5.x'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.1'
recipe 'solr-search', 'Installs and configures Solr 5.x'

depends 'solr', '>= 0.1.5'
depends 'java', '>= 1.29.0'
depends 'ark', '>= 0.9.0'
depends 'firewall', '>= 0.0.0'
depends 'iptables', '>= 0.0.0'
depends 'logrotate', '>= 0.0.0'
depends 'yum-gd', '>= 0.0.0'
depends 'build-essential', '>= 0.0.0'
depends 'python', '>= 0.0.0'
depends 'splunk', '>= 0.0.0'
depends 'datadog', '>= 0.0.0'
depends 'datadog_support', '>= 0.0.0'
depends 'gdp-base-linux', '>= 0.0.0'

%w( centos redhat ).each do |os|
  supports os
end

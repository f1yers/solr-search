name 'solr-search'
maintainer 'Gannett'
maintainer_email 'PaaS-Optimization@gannett.com'
license 'All rights reserved'
description 'Installs and configures Solr 5.x'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.1'
recipe 'solr-search', 'Installs and configures Solr 5.x'

depends 'solr', '>= 0.2.0'
depends 'java', '>= 1.29.0'
depends 'ark', '>= 0.9.0'
depends 'appdynamics', '>= 0.0.0'
depends 'firewall', '>= 0.0.0'
depends 'iptables', '>= 0.0.0'
depends 'logrotate', '>= 0.0.0'
depends 'tomcat', '>=0.0.0'

%w( centos redhat ).each do |os|
  supports os
end

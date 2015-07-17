require 'spec_helper'

describe package('java') do
  it { should be_installed }
end

describe service('solr-solr')
  it { should be_running }
end
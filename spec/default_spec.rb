require 'spec_helper'

describe 'solr-search::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['solr']['exhibitor_url'] = 'not nil'
      node.set['opsmatic']['integration_token'] = 'SomeToken'
      stub_command("which sudo").and_return('/usr/bin/sudo')
      node.set['authorization']['sudo']['groups'] = ["admin", "wheel", "test"]
      node.set['ssh_keys'] = ''
      node.default['ssh_keys'] = { test: ["test"] }
      node.set['users']['teams'] = ['test']
      stub_data_bag_item('users', 'test').and_return({id: "test", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
      stub_data_bag_item('users', 'fhanson').and_return({id: "fhanson", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
      stub_data_bag_item('users', 'rgindes').and_return({id: "rgindes", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
      stub_data_bag_item('users', 'jneves').and_return({id: "jneves", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
      stub_data_bag_item('users', 'jcrawford').and_return({id: "jcrawford", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
      stub_data_bag_item('users', 'blieberman').and_return({id: "blieberman", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
      stub_data_bag_item('users', 'akemner').and_return({id: "akemner", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
    end.converge(described_recipe)
  end

  it 'includes the recipe gdp-base-linux' do
    expect(chef_run).to include_recipe('gdp-base-linux')
  end

  it 'includes the recipe java' do
    expect(chef_run).to include_recipe('java')
  end

  it 'includes the recipe python' do
    expect(chef_run).to include_recipe('python')
  end

  it 'includes the recipe solr' do
    expect(chef_run).to include_recipe('solr')
  end

  it 'includes the recipe datadog_support::solr' do
    expect(chef_run).to include_recipe('datadog_support::solr')
  end
end

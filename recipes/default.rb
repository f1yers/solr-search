#
# Cookbook Name:: solr-search
# Recipe:: default
#
# Copyright 2015, Gannett
#
# All rights reserved - Do Not Redistribute
#

raise if node['platform'] == 'windows'

Chef::Log.warn("template #{node['solr-search']}")

include_recipe 'java'
include_recipe 'iptables'
include_recipe 'firewall'
include_recipe 'solr'
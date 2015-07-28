#
# Cookbook Name:: solr-search
# Recipe:: default
#
# Copyright 2015, Gannett
#
# All rights reserved - Do Not Redistribute
#

fail if node['platform'] == 'windows'
fail if node['solr']['exhibitor_url'].nil?

include_recipe 'gdp-base-linux'
include_recipe 'java'
include_recipe 'python'
include_recipe 'solr'
include_recipe 'datadog_support::solr'

# -*- mode: ruby -*-
# vi: set ft=ruby :

my_iso = '/Users/nmcginnis/vagrant/images/ovftransport.iso'

Vagrant.configure(2) do |config|

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = "~/vagrant/Berksfile"
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = false
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  config.ssh.insert_key = false

    config.vm.define "zknode1", autostart: true do |zknode|
    zknode.vm.box = "centos66-cloud-171"
    #zknode.vm.box = "chef/centos-6.6"
    zknode.vm.provider "virtualbox" do |vb|
      vb.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 0, '--device', 0, '--type', 'dvddrive', '--medium', my_iso]
      vb.name = "zknode1"
      vb.memory = 2048
      vb.cpus = 2
    end
    zknode.vm.hostname = "zknode1"
    #zookeeper
    #zknode.vm.network "forwarded_port", guest: 2181, host: 2181
    #exhibitor
    #zknode.vm.network "forwarded_port", guest: 8080, host: 9080
    zknode.vm.network "private_network", ip: "192.168.10.120"
    zknode.vm.provision :shell, :inline => "ulimit -n 4048"
    zknode.vm.provision :chef_zero do |chef|
      chef.node_name = "zknode1"
      chef.log_level = :info
      chef.roles_path = "~/vagrant/roles"
      chef.data_bags_path = "~/vagrant/data_bags"
      chef.nodes_path = "~/vagrant/nodes"
      chef.add_role("gdmonitor")
      chef.add_role("zookeeper-localdev")
      end
    end

    #base_host_port = 8983
    (1..2).each do |i|
    config.vm.define "shard#{i}", autostart: true do |shard|
      shard.vm.box = "centos66-cloud-171"
      shard.vm.provider "virtualbox" do |vb|
        vb.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 0, '--device', 0, '--type', 'dvddrive', '--medium', my_iso]
        vb.name = "shard#{i}"
        vb.memory = 2048
        vb.cpus = 2

        unless File.exist?("solr-disk#{i}a.vdi")
         #vb.customize ['storagectl', :id, '--name', 'SCSI Controller', '--add', 'scsi']
         vb.customize ['createhd',  '--filename', "solr-disk#{i}a.vdi", '--size', '4096']
         vb.customize ['storageattach', :id, '--storagectl', 'SCSI Controller', '--port', '1', '--device', 0, '--type', 'hdd', '--medium', "solr-disk#{i}a.vdi"]
        end
        unless File.exist?("solr-disk{i}b.vdi")
         #vb.customize ['storagectl', :id, '--name', 'SCSI Controller', '--add', 'scsi']
         vb.customize ['createhd',  '--filename', "solr-disk#{i}b.vdi", '--size', '4096']
         vb.customize ['storageattach', :id, '--storagectl', 'SCSI Controller', '--port', '2', '--device', 0, '--type', 'hdd', '--medium', "solr-disk#{i}b.vdi"]
       end
     end

      shard.vm.hostname = "shard#{i}"
      #shard.vm.network :forwarded_port, host: base_host_port+i-1, guest: 8983 #jetty port
      shard.vm.network "private_network", ip: "192.168.10.12#{i}"
      shard.vm.provision :shell, :inline => "ulimit -n 4048"
      shard.vm.provision :chef_zero do |chef|
        #chef.verbose_logging =true
        #chef.log_level  = :debug
        chef.node_name = "shard#{i}"
        chef.log_level = :info
        chef.roles_path = "~/vagrant/roles"
        chef.cookbooks_path = "~/vagrant/cookbooks"
        chef.data_bags_path = "~/vagrant/data_bags"
        chef.nodes_path = "~/vagrant/nodes"
        chef.add_recipe("solr-search")
      end
    end
  end
end

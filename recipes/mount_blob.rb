#
# Cookbook:: backup-chef-server
# Recipe:: mount_blob
#
# Copyright:: 2018, The Authors, All Rights Reserved.

DIR_BACKUP      = "#{node['backup-chef-server']['mount']['path']}"
CONFIG          = "#{node['backup-chef-server']['mount']['config']}"
USER            = "#{node['backup-chef-server']['user']}"
DATA_BAG        = "#{node['backup-chef-server']['mount']['databag']['name']}"
DATA_BAG_ITEM   = "#{node['backup-chef-server']['mount']['databag']['item']}"

directory 'backup' do
    path DIR_BACKUP
    owner USER
    group USER
    mode '0700'
    recursive true
    action :create
  end

accName   = data_bag_item(DATA_BAG, DATA_BAG_ITEM)['accountName']
accKey    = data_bag_item(DATA_BAG, DATA_BAG_ITEM)['accountKey']
contName  = data_bag_item(DATA_BAG, DATA_BAG_ITEM)['containerName']
#var_teste = data_bag_item()

template 'blob' do
	path CONFIG
	source 'blob.erb'
	owner 'root'
	group 'root'
	mode '0700'
	variables(
		:accountName => accName,
		:accountKey => accKey,
		:containerName => contName)
	action :create_if_missing
  end

#
# Cookbook:: backup-chef-server
# Recipe:: mount_blob
#
# Copyright:: 2018, The Authors, All Rights Reserved.

DIR_BACKUP      = "#{node['backup-chef-server']['mount']['path']}"
DIR_BACKUP_TEMP = "#{node['backup-chef-server']['mount']['path_temp']}"
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


template 'blob' do
  path CONFIG
  source 'blob.erb'
  owner USER
  group USER
  mode '0700'
  variables(
  	:accountName => accName,
  	:accountKey => accKey,
  	:containerName => contName)
  action :create
end

directory 'backup-temp' do
  path DIR_BACKUP_TEMP
  owner USER
  group USER
  mode '0700'
  recursive true
  action :create
end

execute 'mount_blob' do
  command   "blobfuse #{DIR_BACKUP} --config-file=#{CONFIG} --tmp-path=#{DIR_BACKUP_TEMP} --file-cache-timeout-in-seconds=0" 
  group     USER
  user      USER
  action    :run
  #not_if {"`mount | grep #{DIR_BACKUP}`" == ''}
  only_if "[[ -z $(bash -c 'mount | grep #{DIR_BACKUP}') ]]"
end

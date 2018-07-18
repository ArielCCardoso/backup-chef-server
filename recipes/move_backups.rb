#
# Cookbook:: backup-chef-server
# Recipe:: move_backups
#
# Copyright:: 2018, The Authors, All Rights Reserved.

PREFIX_D    = "#{node['backup-chef-server']['diario']['prefix_name']}"
PREFIX_M    = "#{node['backup-chef-server']['mensal']['prefix_name']}"
SCRIPT_D    = "#{node['backup-chef-server']['diario']['script_name']}"
SCRIPT_M    = "#{node['backup-chef-server']['mensal']['script_name']}"
DIR         = "#{node['backup-chef-server']['scripts']}"
SOURCE      = "#{node['backup-chef-server']['path']}"
EXT         = "#{node['backup-chef-server']['ext']}"
DIR_BACKUP  = "#{node['backup-chef-server']['mount']['path']}"
USER        = "#{node['backup-chef-server']['user']}"

directory 'scritps' do
    path DIR
    owner USER
    group USER
    mode '0700'
    recursive true
    action :create
  end

template 'diario' do
	path "#{DIR}/#{SCRIPT_D}"
	source 'scriptBackup.erb'
	owner USER
	group USER
	mode '0700'
	variables(
        :prefixName => PREFIX_D,
        :sourcePath => SOURCE,
        :toPath => DIR_BACKUP,
        :ext => EXT)
	action :create_if_missing
  end

template 'mensal' do
	path "#{DIR}/#{SCRIPT_M}"
	source 'scriptBackup.erb'
	owner USER
	group USER
	mode '0700'
	variables(
        :prefixName => PREFIX_D,
        :sourcePath => SOURCE,
        :toPath => DIR_BACKUP,
        :ext => EXT)
	action :create_if_missing
  end

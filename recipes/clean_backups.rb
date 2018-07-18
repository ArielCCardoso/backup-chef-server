#
# Cookbook:: backup-chef-server
# Recipe:: clean_backups
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Recipe que gera o script para limpeza de backups antigos


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
	action :create_if_missing
  end

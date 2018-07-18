#
# Cookbook:: backup-chef-server
# Recipe:: install_blobfuse
#
# Copyright:: 2018, The Authors, All Rights Reserved.

yum_package 'blobfuse' do
    package_name 'blobfuse'
    action :install
  end
#
# Cookbook:: backup-chef-server
# Recipe:: default
#
# Copyright:: 2018, Ariel Cardoso, All Rights Reserved.

include_recipe "yum-microsoft::default"
include_recipe "backup-chef-server::install_blobfuse"
include_recipe "backup-chef-server::mount_blob"
include_recipe "backup-chef-server::clean_backups"
include_recipe "backup-chef-server::move_backup"
include_recipe "backup-chef-server::backup"
include_recipe "backup-chef-server::backup_mensal"

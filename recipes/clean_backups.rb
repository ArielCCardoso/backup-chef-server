#
# Cookbook:: backup-chef-server
# Recipe:: clean_backups
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Recipe que gera o script para limpeza de backups antigos

USER       = "#{node['backup-chef-server']['user']}"
DIR_BACKUP = "#{node['backup-chef-server']['mount']['path']}"
RET_D      = "#{node['backup-chef-server']['diario']['retention']}"
RET_M      = "#{node['backup-chef-server']['mensal']['retention']}"
PREFIX_D   = "#{node['backup-chef-server']['diario']['prefix_name']}"
PREFIX_M   = "#{node['backup-chef-server']['mensal']['prefix_name']}"
EXT        = "#{node['backup-chef-server']['ext']}"
SOURCE     = "#{node['backup-chef-server']['path']}"

bash 'clean_backups' do
    cwd        '/tmp'
    user       USER
    action     :run
    code       <<-CODE
    find #{SOURCE} -type f -name "*.#{EXT}" -exec rm -f {} \\;
    find #{DIR_BACKUP} -type f -name "#{PREFIX_D}*.#{EXT}" -mtime +#{RET_D} -exec rm -f {} \\;
    find #{DIR_BACKUP} -type f -name "#{PREFIX_M}*.#{EXT}" -mtime +#{RET_M} -exec rm -f {} \\;
    CODE
    only_if "[[ -z $(ps -ef | grep 'chef-server-ctl backup --yes' | grep -v grep) ]]"
  end

#bash 'clean_diario' do
#    cwd        '/tmp'
#    user       USER
#    action     :run
#    code       "find #{DIR_BACKUP} -type f -name '#{PREFIX_D}*.#{EXT}' -mtime +#{RET_D} -exec rm -f {} \\;"
#  end
#
#bash 'clean_mensal' do
#    cwd        '/tmp'
#    user       USER
#    action     :run
#    code       "find #{DIR_BACKUP} -type f -name '#{PREFIX_M}*.#{EXT}' -mtime +#{RET_M} -exec rm -f {} \\;"
#  end
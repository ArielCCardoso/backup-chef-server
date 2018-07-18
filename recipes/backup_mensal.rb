#
# Cookbook:: backup-chef-server
# Recipe:: backup_mensal
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#Cron Values
MINUTE  = "#{node['backup-chef-server']['mensal']['cron']['minute']}"
HOUR    = "#{node['backup-chef-server']['mensal']['cron']['hour']}"
DAY     = "#{node['backup-chef-server']['mensal']['cron']['day']}"
MONTH   = "#{node['backup-chef-server']['mensal']['cron']['month']}"
WEEKDAY = "#{node['backup-chef-server']['mensal']['cron']['weekday']}"
USER    = "#{node['backup-chef-server']['user']}"

#Move backup
SCRIPT = "#{node['backup-chef-server']['scripts']}/#{node['backup-chef-server']['mensal']['script_name']}"

cron_d 'chef-server-backup-mensal' do
  minute  MINUTE
  hour    HOUR
  day     DAY
  month   MONTH
  weekday WEEKDAY
  user    USER
  command "chef-server-ctl backup --yes && #{SCRIPT}"
  user    USER
end

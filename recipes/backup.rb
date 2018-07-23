#
# Cookbook:: backup-chef-server
# Recipe:: backup
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#Cron Values
MINUTE  = "#{node['backup-chef-server']['diario']['cron']['minute']}"
HOUR    = "#{node['backup-chef-server']['diario']['cron']['hour']}"
DAY     = "#{node['backup-chef-server']['diario']['cron']['day']}"
MONTH   = "#{node['backup-chef-server']['diario']['cron']['month']}"
WEEKDAY = "#{node['backup-chef-server']['diario']['cron']['weekday']}"
USER    = "#{node['backup-chef-server']['user']}"

#Move backup
SCRIPT = "#{node['backup-chef-server']['scripts']}/#{node['backup-chef-server']['diario']['script_name']}"

cron_d 'chef-server-backup' do
  minute  MINUTE
  hour    HOUR
  day     DAY
  month   MONTH
  weekday WEEKDAY
  user    USER
  command SCRIPT
  user    USER
  action  :create
end

#
# Cookbook:: backup-chef-server
# Recipe:: backup
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#Cron Values
MINUTE  = "#{node["backup-chef-server"]["cron"]["minute"]}"
HOUR    = "#{node["backup-chef-server"]["cron"]["hour"]}"
DAY     = "#{node["backup-chef-server"]["cron"]["day"]}"
MONTH   = "#{node["backup-chef-server"]["cron"]["month"]}"
WEEKDAY = "#{node["backup-chef-server"]["cron"]["weekday"]}"
USER    = "#{node["backup-chef-server"]["user"]}"


cron_d 'chef-server-backup' do
  minute  MINUTE
  hour    HOUR
  day     DAY
  month   MONTH
  weekday WEEKDAY
  user    USER
  command 'chef-server-ctl backup --yes'
  user    USER
end

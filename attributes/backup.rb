default['chef-server-backup']['mailto']          = 'root'
default['chef-server-backup']['retention_days']  = '5'
#default['chef-server-backup']['backup_name']     = 'chef_backup'
#default['chef-server-backup']['working_dir']     = '/tmp'
#default['chef-server-backup']['db_user']         = 'opscode-pgsql'
#default['chef-server-backup']['backup_store']    = '/etc/chef_backup'
default['chef-server-backup']['cron']['minute']  = '0'
default['chef-server-backup']['cron']['hour']    = '23'
default['chef-server-backup']['cron']['day']     = '*'
default['chef-server-backup']['cron']['month']   = '*'
default['chef-server-backup']['cron']['weekday'] = '*'
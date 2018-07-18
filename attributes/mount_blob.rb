# Atributos para a montagem do blob

default['backup-chef-server']['mount']['path'] = '/devops/chef-server-backup'
default['backup-chef-server']['mount']['path_temp'] = '/mnt/resource/chef-server-backup-tmp'
default['backup-chef-server']['mount']['config'] = '/devops/blob.cfg'
default['backup-chef-server']['mount']['databag']['name'] = 'bigdata-databag'
default['backup-chef-server']['mount']['databag']['item'] = 'azure-blob'
#default['backup-chef-server']['mount']['access']['accountName'] =
#default['backup-chef-server']['mount']['access']['accessKey'] =
#default['backup-chef-server']['mount']['access']['containerName'] =

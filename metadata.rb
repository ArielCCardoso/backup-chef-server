name 'backup-chef-server'
maintainer 'Ariel Cardoso'
maintainer_email 'arielccardoso@live.com'
license 'All Rights Reserved'
description 'Installs/Configures backup-chef-server'
long_description 'Installs/Configures backup-chef-server'
version '0.1.0'
chef_version '>= 12.14' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/backup-chef-server/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/backup-chef-server'

depends 'cron', '~> 6.1.1'

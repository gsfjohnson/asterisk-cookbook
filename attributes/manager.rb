#
# Cookbook Name:: asterisk
# Attributes:: manager
#

# [general]
default['asterisk']['manager']['enabled']         = 'yes'
default['asterisk']['manager']['port']            = 5038
default['asterisk']['manager']['ip_address']      = node['ec2'] ? node['ec2']['public_ipv4'] : node['ipaddress']
default['asterisk']['manager']['webenabled']      = 'yes'
default['asterisk']['manager']['timestampevents'] = 'yes'

# [user] section
default['asterisk']['manager']['username']    = 'manager'
default['asterisk']['manager']['password']    = 'password'
default['asterisk']['manager']['deny']        = '0.0.0.0/0.0.0.0'
default['asterisk']['manager']['permit']      = '127.0.0.1/255.255.255.0'
default['asterisk']['manager']['read_perms']  = %w(system call log verbose command agent user config)
default['asterisk']['manager']['write_perms'] = %w(system call log verbose command agent user config)
default['asterisk']['manager']['event_filters'] = []

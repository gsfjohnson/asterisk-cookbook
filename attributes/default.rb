#
# Cookbook Name:: asterisk
# Attributes:: default
#

default['asterisk']['install_method'] = 'source'

# Ownership / run-as user
default['asterisk']['user']   = 'asterisk'
default['asterisk']['group']  = 'asterisk'

default['asterisk']['prefix']['bin']    = '/usr'
default['asterisk']['prefix']['conf']   = '/etc'
default['asterisk']['prefix']['state']  = '/var'

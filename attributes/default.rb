#
# Cookbook Name:: asterisk
# Attributes:: default
#

default['asterisk']['install_method'] = 'source'

# Ownership / run-as user
default['asterisk']['user']   = 'asterisk'
default['asterisk']['group']  = 'asterisk'

default['asterisk'][:prefix_bin]    = '/usr'
default['asterisk'][:prefix_conf]   = '/etc'
default['asterisk'][:prefix_state]  = '/var'

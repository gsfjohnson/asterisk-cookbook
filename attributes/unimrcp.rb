#
# Cookbook Name:: asterisk
# Attributes:: unimrcp
#

default['asterisk']['unimrcp']['version'] = '1.1.0'
default['asterisk']['unimrcp']['packages'] = %w{pkg-config build-essential}
default['asterisk']['unimrcp']['install_dir'] = '/usr/local/unimrcp'
default['asterisk']['unimrcp']['server_ip'] = '127.0.0.1'
default['asterisk']['unimrcp']['server_port'] = '5060'
default['asterisk']['unimrcp']['client_ip'] = node['ec2'] ? node['ec2']['public_ipv4'] : node['ipaddress']
default['asterisk']['unimrcp']['client_port'] = '25097'
default['asterisk']['unimrcp']['rtp_ip'] = node['ec2'] ? node['ec2']['public_ipv4'] : node['ipaddress']
default['asterisk']['unimrcp']['rtp_port_min'] = '28000'
default['asterisk']['unimrcp']['rtp_port_max'] = '29000'

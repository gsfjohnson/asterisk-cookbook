#
# Cookbook Name:: asterisk
# Attributes:: package
#


default['asterisk']['package']['names'] = case node['platform_family']
when 'debian'
  %w( asterisk )
when 'rhel', 'fedora'
  %w( asterisk sox )
end

case node['platform_family']
when 'debian'
  default['asterisk']['package']['repo']['url']       = 'http://packages.asterisk.org/deb'
  default['asterisk']['package']['repo']['distro']    = node['lsb']['codename']
  default['asterisk']['package']['repo']['branches']  = %w(main)
  default['asterisk']['package']['repo']['keyserver'] = 'pgp.mit.edu'
  default['asterisk']['package']['repo']['key']       = '175E41DF'
  default['asterisk']['package']['repo']['enable']    = false

when 'rhel'
  if node['platform_version'].include?('7.')
    default['asterisk']['package']['repo']['urls'] = {
      'asterisk-14' => 'https://ast.tucny.com/repo/asterisk-14/el$releasever/$basearch/',
      'asterisk-common' => 'https://ast.tucny.com/repo/asterisk-common/el$releasever/$basearch/',
    }
    default['asterisk']['package']['repo']['enable']    = true

  elsif node['platform_version'].include?('6.')
    default['asterisk']['package']['repo']['urls'] = {
      'asterisk-11' => 'http://packages.asterisk.org/centos/$releasever/asterisk-11/$basearch/',
      'asterisk-current' => 'http://packages.asterisk.org/centos/$releasever/current/$basearch/',
      'digium-asterisk-current' => 'http://packages.digium.com/centos/$releasever/current/$basearch/',
    }
    default['asterisk']['package']['repo']['enable']    = false

  end
end

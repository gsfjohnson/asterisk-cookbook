#
# Cookbook Name:: asterisk
# Recipe:: unimrcp
#


include_recipe "unimrcp"

directory "/var/lib/asterisk/documentation/thirdparty" do
  mode 0644
  action :create
  recursive true
end

bash "install_unimrcp_asterisk_modules" do
  user "root"
  cwd File.join(node['unimrcp']['src_dir'], 'modules')
  code <<-EOH
    ./configure
    make
    make install
  EOH
  not_if 'asterisk -x "module show like unimrcp" | grep "2 modules loaded"'
end

template "#{node['asterisk'][:prefix_conf]}/asterisk/mrcp.conf" do
  source "mrcp.conf.erb"
  mode 0644
  notifies :reload, resources('service[asterisk]')
end

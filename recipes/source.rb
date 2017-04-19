#
# Cookbook Name:: asterisk
# Recipe:: source
#


include_recipe 'apt'

include_recipe 'build-essential'

node['asterisk']['source']['packages'].each do |pkg|
  package pkg do
    options "--force-yes" if node['platform_family'] == 'debian'
  end
end

pkg_config_path = "/usr/lib/pkgconfig"
version = node['asterisk']['source']['version']
certified = true if version.match(/cert/)
chksum = node['asterisk']['source']['checksum']
source_tarball = "#{'certified-' if certified}asterisk-#{version}.tar.gz"
source_url_prefix = "http://downloads.asterisk.org/pub/telephony/#{'certified-' if certified}asterisk/"
source_url_prefix << 'releases/' unless version.match(/current/)
source_url = node['asterisk']['source']['url'] ||
    source_url_prefix + source_tarball
source_path = "#{Chef::Config['file_cache_path'] || '/tmp'}/#{source_tarball}"

remote_file source_tarball do
  source source_url
  path source_path
  checksum chksum
  backup false
  notifies :create, 'ruby_block[validate asterisk tarball]', :immediately
end

# The checksum on remote_file is used only to determine if a file needs downloading
# Here we verify the checksum for security/integrity purposes
ruby_block 'validate asterisk tarball' do
  action :nothing
  block do
    require 'digest'
    expected = chksum
    actual = Digest::SHA256.file(source_path).hexdigest
    if expected and actual != expected
      raise "Checksum mismatch on #{source_path}.  Expected sha256 of #{expected} but found #{actual} instead"
    end
  end
  only_if { chksum }
end

bash "install_asterisk p1" do
  user "root"
  cwd File.dirname(source_path)
  code <<-EOH
    tar zxf #{source_path}
    cd #{'certified-' if certified}asterisk-#{version =~ /(\d*)-current/ ? "#{$1}.*" : version}
    ./contrib/scripts/install_prereq install
  EOH
  not_if "test -f #{node['asterisk'][:prefix_bin]}/sbin/asterisk"
end

execute 'configure with pkg-config' do
    command "su root -l -c 'PKG_CONFIG_PATH=#{pkg_config_path} ./configure --prefix=#{node['asterisk'][:prefix_bin]} --sysconfdir=#{node['asterisk'][:prefix_conf]} --localstatedir=#{node['asterisk'][:prefix_state]}'"
    not_if "test -f #{node['asterisk'][:prefix_bin]}/sbin/asterisk"
end

bash "install_asterisk p2" do
  user "root"
  cwd File.dirname(source_path)
  code <<-EOH
    make
    make install
    make config
    #{'make samples' if node['asterisk']['source']['install_samples']}
    ldconfig
  EOH
  not_if "test -f #{node['asterisk'][:prefix_bin]}/sbin/asterisk"
  notifies :reload, 'service[asterisk]'
end

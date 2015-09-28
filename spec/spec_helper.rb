require 'serverspec'
require 'net/ssh'
require 'yaml'

set :backend, :ssh

if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available. Try installing it."
  end
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

host = ENV['TARGET_HOST']

hosts_file = 'spec/hosts.yml'
hosts_info = YAML.load_file(hosts_file)
main_role = hosts_info.select { |k, v| v[:hosts].include?(host) if v[:hosts] }.keys.first

options = Net::SSH::Config.for(host)
if hosts_info['shared_settings'] then
  if hosts_info['shared_settings'][:ssh_options] then
    options.merge!(hosts_info['shared_settings'][:ssh_options])
    ENV['LOGIN_USER'] = hosts_info['shared_settings'][:ssh_options][:user] if hosts_info['shared_settings'][:ssh_options][:user]
  end
end
if hosts_info[main_role][:ssh_options] then
  options.merge!(hosts_info[main_role][:ssh_options])
  ENV['LOGIN_USER'] = hosts_info[main_role][:ssh_options][:user] if hosts_info[main_role][:ssh_options][:user]
end

options[:user] ||= Etc.getlogin

set :host,        options[:host_name] || host
set :ssh_options, options

# Disable sudo
# set :disable_sudo, true


# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C'

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'

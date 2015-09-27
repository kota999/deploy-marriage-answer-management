require 'spec_helper'

basic_pkgs = Array['gcc', 'gcc-c++', 'gcc-gfortran', 'make', 'patch', 'kernel-devel', \
  'curl', 'libcurl-devel', 'git', 'libselinux-python', 'iptables']
for pkg in basic_pkgs do
  describe package(pkg), :if => os[:family] == 'redhat' do
    it { should be_installed }
  end
end

# For rhel7, centos7 -> firewalld
if os[:family] == 'redhat' and os[:release][0] == '7' then
  describe package('firewalld') do
    it { should be_installed }
  end
end

rails_require_pkgs = Array['openssl-devel', 'libyaml-devel', 'libffi-devel', 'readline-devel', \
  'zlib-devel', 'gdbm-devel', 'ncurses-devel', 'postgresql', 'postgresql-devel']
for pkg in rails_require_pkgs do
  describe package(pkg), :if => os[:family] == 'redhat' do
    it { should be_installed }
  end
end

nodejs_require_pkgs = Array['nodejs', 'npm']
for pkg in nodejs_require_pkgs do
  describe package(pkg), :if => os[:family] == 'redhat' do
    it { should be_installed }
  end
end

#describe service('httpd'), :if => os[:family] == 'redhat' do
  #it { should be_enabled }
  #it { should be_running }
#end

#describe port(80) do
  #it { should be_listening }
#end

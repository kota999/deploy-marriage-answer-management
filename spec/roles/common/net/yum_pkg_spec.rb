require 'spec_helper'

basic_pkgs = Array['iptables']
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


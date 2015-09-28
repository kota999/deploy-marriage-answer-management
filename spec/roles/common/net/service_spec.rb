require 'spec_helper'

if os[:family] == 'redhat' and os[:release][0] == '7'
  describe service('firewalld') do
    it { should be_enabled }
    it { should be_running }
  end
end

if os[:family] == 'redhat'
  describe service('iptables') do
    it { should be_enabled }
    it { should be_running }
  end
end

if os[:family] == 'redhat' and os[:release][0] == '6'
  describe service('firewall') do
    it { should be_enabled }
    it { should be_running }
  end
end

describe port(3000) do
  it { should be_listening }
end

describe port(3005) do
  it { should be_listening }
end


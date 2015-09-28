require 'spec_helper'

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

require 'spec_helper'

repos = Array['rpmforge', 'remi', 'epel']

for repo in repos
  describe yumrepo(repos), :if => os[:family] == 'redhat' do
    it { should exist }
  end
end

#describe service('httpd'), :if => os[:family] == 'redhat' do
  #it { should be_enabled }
  #it { should be_running }
#end

#describe port(80) do
  #it { should be_listening }
#end

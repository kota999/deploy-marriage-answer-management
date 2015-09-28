require 'spec_helper'

basic_pkgs = Array['gcc', 'gcc-c++', 'gcc-gfortran', 'make', 'patch', 'kernel-devel', \
  'curl', 'libcurl-devel', 'git']
for pkg in basic_pkgs do
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

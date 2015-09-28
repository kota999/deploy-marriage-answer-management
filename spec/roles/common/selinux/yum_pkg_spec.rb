require 'spec_helper'

basic_pkgs = Array['libselinux-python']
for pkg in basic_pkgs do
  describe package(pkg), :if => os[:family] == 'redhat' do
    it { should be_installed }
  end
end


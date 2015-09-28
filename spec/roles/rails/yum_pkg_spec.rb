require 'spec_helper'

rails_require_pkgs = Array['openssl-devel', 'libyaml-devel', 'libffi-devel', 'readline-devel', \
  'zlib-devel', 'gdbm-devel', 'ncurses-devel', 'postgresql', 'postgresql-devel']
for pkg in rails_require_pkgs do
  describe package(pkg), :if => os[:family] == 'redhat' do
    it { should be_installed }
  end
end


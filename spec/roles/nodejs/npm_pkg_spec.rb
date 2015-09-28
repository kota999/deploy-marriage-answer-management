require 'spec_helper'

npm_pkgs = Array['forever']

for pkg in npm_pkgs
  describe package(pkg) do
    it { should be_installed.by(:npm) }
  end
end

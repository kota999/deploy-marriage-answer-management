require 'spec_helper'

user = ENV['LOGIN_USER']
ruby_version='2.1.2'

#
# install rbenv and ruby
#
describe file("/home/#{user}/.rbenv") do
  it { should be_directory }
end

describe file("/home/#{user}/.rbenv/plugins/ruby-build") do
  it { should be_directory }
end

describe command('which rbenv') do
  let(:sudo_options) { "-u #{user} -i" }
  #its(:stdout) { should contain('rbenv') }
  its(:stdout) { should match 'rbenv' }
end

describe command('rbenv versions') do
  let(:sudo_options) { "-u #{user} -i" }
  its(:stdout) { should match ruby_version }
end

describe command('ruby -v') do
  let(:sudo_options) { "-u #{user} -i" }
  its(:stdout) { should match ruby_version }
end


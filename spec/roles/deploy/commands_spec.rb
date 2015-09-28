require 'spec_helper'

user = ENV['LOGIN_USER']

#
# Install marriage-answer-management
#
describe file("/home/#{user}/marriage-answer-management") do
  it { should be_directory }
end

#
# Install nodejs application
#
# "aaa" is dammy directory
describe file("/home/#{user}/aaa") do
  it { should be_directory }
end

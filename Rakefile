require 'rake'
require 'yaml'
require 'rspec/core/rake_task'

task :spec    => 'spec:all'
task :default => :spec

hosts_file = 'spec/site.yml'
hosts_info = YAML.load_file(hosts_file)

namespace :spec do
  # For spec:all, create spec:master_role:host
  all_tasks = hosts_info.each_pair.map{ |key, values|
    # Skip shared ssh options
    next if key == 'shared_settings'
    values[:hosts].map {|host| 'spec:' + key + ':' + host}
  }.flatten.compact

  # (spec:all)
  desc "Run serverspec test to all hosts"
  task :all => all_tasks

  # Each master_role
  hosts_info.each_pair do |master_role, entries|
    # Skip shared ssh options
    next if master_role == 'shared_settings'
    # Create role pattern
    role_pattern = entries[:roles].join(',')

    # Each hosts from master_role
    namespace master_role.to_sym do
      hosts = entries[:hosts]

      desc "Run serverspec test to all hosts of #{master_role} for #{role_pattern}"
      task :all => hosts.map { |h| 'spec:' + master_role + ':' + h}

      # Each host
      hosts.each do |host|
        desc "Run serverspec tests to #{master_role}:#{host} for #{role_pattern}"
        RSpec::Core::RakeTask.new(host.to_sym) do |t|
          t.fail_on_error = false
          # Setting run host
          ENV['TARGET_HOST'] = host
          t.pattern = "spec/roles/{#{role_pattern}}/**/*_spec.rb"
        end
      end
    end
  end
end

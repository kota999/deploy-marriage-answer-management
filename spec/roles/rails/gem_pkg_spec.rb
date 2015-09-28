require 'spec_helper'

user = ENV['LOGIN_USER']

gem_pkgs = Array['bundler', 'rails', 'pg', 'sass-rails', 'uglifier', 'coffee-rails', \
  'jquery-rails', 'turbolinks', 'jbuilder', 'sdoc', 'spring', 'foreman', 'puma', 'devise', \
  'aasm', 'haml-rails', 'bootstrap-sass', 'autoprefixer-rails', 'compass-rails', \
  'font-awesome-rails', 'bootstrap_form', 'activerecord-import', 'html2haml', 'redcarpet', \
  'rinku', 'nokogiri', 'kaminari', 'execjs', 'awesome_print', 'better_errors', 'binding_of_caller', \
  'bullet', 'hirb', 'hirb-unicode', 'letter_opener', 'pry-byebug', 'pry-doc', 'pry-rails', 'pry-stack_explorer', \
  'quiet_assets', 'tapp', 'view_source_map', 'thin', 'rails-footnotes', 'guard-livereload', \
  'rails_12factor', 'newrelic_rpm']

for pkg in gem_pkgs
  describe package(pkg) do
    let(:sudo_options) { "-u #{user} -i" }
    it { should be_installed.by(:gem) }
  end
end

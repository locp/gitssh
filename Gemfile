source ENV['GEM_SOURCE'] || "https://rubygems.org"

puppetversion = ENV.key?('PUPPET_GEM_VERSION') ? " #{ENV['PUPPET_GEM_VERSION']}" : ['>= 4.0']
gem 'puppet', puppetversion
gem 'facter', '>= 1.7.0'

group :system_tests do
  gem 'coveralls',              :require => false
  gem 'puppet-blacksmith',      :require => false
  gem 'puppetlabs_spec_helper', :require => false
end

group :development do
  gem 'metadata-json-lint',   :require => false
  gem 'puppet-lint',          :require => false
  gem 'travis',               :require => false
  gem 'travis-lint',          :require => false
end

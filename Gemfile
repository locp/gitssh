source ENV['GEM_SOURCE'] || 'https://rubygems.org'

puppetversion = ENV['PUPPET_GEM_VERSION']

if puppetversion
  gem 'puppet', puppetversion, require: false
else
  gem 'puppet', '>= 4.0'
end

gem 'facter', '>= 1.7.0'

group :system_tests do
  gem 'backports',              '3.6.8'
  gem 'beaker',                 '2.33.0'
  gem 'beaker-rspec',           require: false
  gem 'coveralls',              require: false
  gem 'docker-api',             require: false
  gem 'google-api-client',      '<= 0.9.4'
  gem 'json_pure',              '<= 2.0.1'
  gem 'metadata-json-lint',     require: false
  gem 'pry',                    require: false
  gem 'puppet-blacksmith',      require: false
  gem 'puppet-lint',            require: false
  gem 'puppetlabs_spec_helper', require: false
  gem 'rspec_junit_formatter',  '0.2.2'
  gem 'rspec-puppet',           '<= 2.3.2'
  gem 'rspec-puppet-utils',     require: false
  gem 'serverspec',             require: false
  gem 'specinfra',              '<= 2.59.0'
  gem 'spdx-licenses',          '<= 1.0.0'
  gem 'tins',                   '<= 1.6.0'
end

group :development do
  gem 'travis',               require: false
  gem 'travis-lint',          require: false
end

# rspec must be v2 for ruby 1.8.7
if RUBY_VERSION >= '1.8.7' && RUBY_VERSION < '1.9'
  gem 'rspec', '~> 2.0'
  gem 'rake', '~> 10.0'
else
  # rubocop requires ruby >= 1.9
  gem 'rubocop', '<= 0.41.2'
end

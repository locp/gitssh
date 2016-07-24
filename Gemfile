source ENV['GEM_SOURCE'] || 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_GEM_VERSION') ? " #{ENV['PUPPET_GEM_VERSION']}" : ['>= 4.0']
gem 'puppet', puppetversion
gem 'facter', '>= 1.7.0'

group :system_tests do
  gem 'beaker-rspec',           require: false
  gem 'coveralls',              require: false
  gem 'docker-api',             require: false
  gem 'metadata-json-lint',     require: false
  gem 'pry',                    require: false
  gem 'puppet-blacksmith',      require: false
  gem 'puppet-lint',            require: false
  gem 'puppetlabs_spec_helper', require: false
  gem 'rspec_junit_formatter',  require: false
  gem 'rspec-puppet',           require: false
  gem 'rspec-puppet-utils',     require: false
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
  gem 'rubocop'
end

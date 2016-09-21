require 'spec_helper'

describe 'gitssh' do
  let!(:stdlib_stubs) do
    MockFunction.new('size') do |f|
      f.stubbed.with([]).returns(0)
    end
  end

  puppetversion = Gem.loaded_specs['puppet'].version

  context "With defaults for all parameters (puppet-#{puppetversion})" do
    let :facts do
      {
        puppetversion: puppetversion.to_s
      }
    end

    it do
      should contain_class('gitssh')
        .with(
          basedir: '/var/git',
          package_ensure: 'present',
          package_name: 'git',
          purge_ssh_keys: 'true'
        )
      should contain_package('git').with('ensure' => 'present')
      should contain_user('git').with('home' => '/var/git')
      should contain_exec('/bin/echo /usr/bin/git-shell >> /etc/shells')
    end
  end
end

require 'spec_helper'
describe 'gitssh' do

  context 'with defaults for all parameters' do
    it {
      should contain_class('gitssh').with({
        'basedir'        => '/var/git',
        'package_ensure' => 'present',
        'package_name'   => 'git',
        'purge_ssh_keys' => 'true',
      })
    }

    it {
      should contain_package('git').with({
        'ensure' => 'present'
      })
    }

    it {
      should contain_user('git').with({
        'home'           => '/var/git',
        'purge_ssh_keys' => true,
      })
    }

    it {
      should contain_exec('/bin/echo /usr/bin/git-shell >> /etc/shells')
    }

    it {
      should contain_file('/var/git/repos').with({
        'ensure' => 'directory',
        'owner'  => 'git',
        'group'  => 'git',
        'mode'   => '0700'
      })
    }
  end
end

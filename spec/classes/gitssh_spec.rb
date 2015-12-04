require 'spec_helper'
describe 'gitssh' do

  context 'with defaults for all parameters' do
    it {
      should contain_class('gitssh')
    }
    it {
      should contain_package('git')
    }
    it {
      should contain_user('git')
    }
    it {
      should contain_exec('/bin/echo /usr/bin/git-shell >> /etc/shells')
    }
  end
end

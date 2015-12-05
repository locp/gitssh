require 'spec_helper'
describe 'gitssh::repo' do
  context 'Add a repo' do
    let(:title) { 'foobar' }

    it {
      should contain_exec('/usr/bin/mkdir /var/git/repos/foobar.git').with({
        'user' => 'git',
      })

      should contain_exec('create_repo').with({
        'command'     => '/usr/bin/git --bare init',
        'cwd'         => '/var/git/repos/foobar.git',
        'refreshonly' => true,
        'user'        => 'git',
      })
    }
  end
end

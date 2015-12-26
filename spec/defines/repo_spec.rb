require 'spec_helper'
describe 'gitssh::repo' do
  context 'Add a repo' do
    let(:title) { 'foobar' }

    it {
      should contain_exec('/usr/bin/mkdir /var/git/foobar.git').with({
        'user' => 'git',
      })

      should contain_exec('create_repo foobar').with({
        'command'     => '/usr/bin/git --bare init',
        'cwd'         => '/var/git/foobar.git',
        'refreshonly' => true,
        'user'        => 'git',
      })
    }
  end
end

require 'spec_helper'
describe 'gitssh::repo' do
  let!(:stdlib_stubs) do
    MockFunction.new('size') do |f|
      f.stubbed.with([]).returns(0)
    end
  end

  context 'Add a repo (Red Hat)' do
    let(:title) { 'foobar' }

    let :facts do
      {
        osfamily: 'RedHat'
      }
    end

    it do
      should contain_exec('/usr/bin/mkdir /var/git/foobar.git')
        .with('user' => 'git')

      should contain_exec('create_repo foobar')
        .with('command' => '/usr/bin/git --bare init',
              'cwd'         => '/var/git/foobar.git',
              'refreshonly' => true,
              'user'        => 'git')
    end
  end

  context 'Add a repo (Debian)' do
    let(:title) { 'foobar' }

    let :facts do
      {
        osfamily: 'Debian'
      }
    end

    it do
      should contain_exec('/bin/mkdir /var/git/foobar.git')
        .with('user' => 'git')

      should contain_exec('create_repo foobar')
        .with('command' => '/usr/bin/git --bare init',
              'cwd'         => '/var/git/foobar.git',
              'refreshonly' => true,
              'user'        => 'git')
    end
  end
end

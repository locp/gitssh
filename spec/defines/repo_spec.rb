require 'spec_helper'
describe 'gitssh::repo' do
  let!(:stdlib_stubs) do
    MockFunction.new('size') do |f|
      f.stubbed.with([]).returns(0)
    end
  end

  context 'Add a repo' do
    let(:title) { 'foobar' }

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
end

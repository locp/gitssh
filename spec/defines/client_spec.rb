require 'spec_helper'
describe 'gitssh::client' do
  context 'Manage authorised SSH key' do
    let(:title) { 'nick@magpie.puppetlabs.lan' }

    let :params do
      {
        key: 'AAAAB...aQ=='
      }
    end

    it do
      should contain_gitssh__client('nick@magpie.puppetlabs.lan').with(
        ensure: 'present',
        type:   'ssh-rsa',
        key:    'AAAAB...aQ=='
      )

      should contain_ssh_authorized_key(
        'gitssh::client::nick@magpie.puppetlabs.lan'
      ).with('user' => 'git',
             'type' => 'ssh-rsa',
             'key'  => 'AAAAB...aQ==')
    end
  end
end

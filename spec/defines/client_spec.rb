require 'spec_helper'
describe 'gitssh::client' do
  context 'Manage authorised SSH key' do
    let(:title) { 'nick@magpie.puppetlabs.lan' }

    let :params do
      {
        :key => 'AAAAB...aQ=='
      }
    end

    it {
      should contain_ssh_authorized_key('nick@magpie.puppetlabs.lan').with({
        'user' => 'git',
        'type' => 'ssh-rsa',
        'key'  => 'AAAAB...aQ==',
      })
    }
  end
end

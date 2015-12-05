require 'spec_helper'
describe 'gitssh::client' do
  context 'Manage authorised SSH key' do
    let :params do
      {
        :clientid => 'nick@magpie.puppetlabs.lan',
        :key      => 'AAAAB...aQ=='
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

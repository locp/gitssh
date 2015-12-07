require 'spec_helper_acceptance'

describe 'gitssh class' do
  pre_req_install_pp = <<-EOS
    include '::gitssh'

    gitssh::client { 'nick@magpie.puppetlabs.lan':
      key => 'AAAAB...aQ==',
    }

    gitssh::client { 'fbl42':
      key => 'AAAAB...Aq==',
    }

    gitssh::client { 'jbi72':
      ensure => absent
    }

    gitssh::repo { 'foo': }
    gitssh::repo { 'bar': }

    gitssh::repo { 'deleteme':
      ensure => absent
    }
  EOS

  describe 'Git SSH installation.' do
    it 'should work with no errors' do
      apply_manifest(pre_req_install_pp, :catch_failures => true)
      expect(apply_manifest(pre_req_install_pp,
        :catch_failures => true).exit_code).to be_zero
    end
  end
end

require 'spec_helper_acceptance'

describe 'gitssh class' do
  pre_req_install_pp = <<-EOS
    include '::gitssh'
  EOS

  describe 'Git SSH installation.' do
    it 'should work with no errors' do
      apply_manifest(pre_req_install_pp, :catch_failures => true)
      expect(apply_manifest(pre_req_install_pp,
        :catch_failures => true).exit_code).to be_zero
    end
  end
end

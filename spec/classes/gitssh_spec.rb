require 'spec_helper'
describe 'gitssh' do

  context 'with defaults for all parameters' do
    it {
      should contain_class('gitssh')
      should contain_package('git')
    }
  end
end
require 'spec_helper'
describe 'gitssh' do

  context 'with defaults for all parameters' do
    it { should contain_class('gitssh') }
  end
end

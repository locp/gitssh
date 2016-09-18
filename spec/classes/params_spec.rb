require 'spec_helper'

describe 'gitssh::params' do
  context 'with defaults for all parameters' do
    it do
      should contain_class('gitssh::params')
    end
  end
end

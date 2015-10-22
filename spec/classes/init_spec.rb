require 'spec_helper'
describe 'drone' do

  context 'with defaults for all parameters' do
    it { should contain_class('drone') }
  end
end

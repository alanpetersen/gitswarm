require 'spec_helper'
describe 'gitswarm' do

  context 'with defaults for all parameters' do
    it { should contain_class('gitswarm') }
  end
end

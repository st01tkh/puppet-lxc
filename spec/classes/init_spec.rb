require 'spec_helper'
describe 'vagrant_lxc' do

  context 'with defaults for all parameters' do
    it { should contain_class('vagrant_lxc') }
  end
end

require 'spec_helper'
describe 'appmgmt_blog' do

  context 'with defaults for all parameters' do
    it { should contain_class('appmgmt_blog') }
  end
end

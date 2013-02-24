require 'spec_helper'

describe 'scala', :type => :class do
  it { should include_class('scala::package') }
  it { should include_class('wget') }
  it { should contain_package('scala').with_ensure('installed') }
  it { should contain_package('typesafe-repo').with_ensure('installed') }
  it { should contain_package('typesafe-stack').with_ensure('installed') }
end

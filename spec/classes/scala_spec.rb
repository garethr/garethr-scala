require 'spec_helper'

describe 'scala', :type => :class do
  let(:facts) { {:osfamily => 'Debian', :lsbdistcodename => 'precise'} } 

  it { should include_class('wget') }
  it { should contain_package('scala').with_ensure('installed') }
  it { should contain_package('typesafe-repo').with_ensure('installed') }
  it { should contain_package('typesafe-stack').with_ensure('installed') }

  context 'with an invalid distro name' do
    let(:facts) { {:osfamily => 'RedHat', :lsbdistcodename => 'centos'} }
    it do
      expect {
        should contain_package('scala')
      }.to raise_error(Puppet::Error, /This module relies on a deb package/)
    end
  end

end

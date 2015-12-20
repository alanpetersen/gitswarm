require 'spec_helper'
describe 'gitswarm' do

  context 'with supported Ubuntu (trusty)' do
    let(:facts) {{
        :osfamily        => 'Debian',
        :lsbdistid       => 'Ubuntu',
        :operatingsystem => 'Ubuntu',
        :lsbdistcodename => 'trusty'
    }}
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_package('helix-gitswarm')}
  end

  context 'with supported Ubuntu (precise)' do
    let(:facts) {{
        :osfamily        => 'Debian',
        :lsbdistid       => 'Ubuntu',
        :operatingsystem => 'Ubuntu',
        :lsbdistcodename => 'precise'
    }}
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_package('helix-gitswarm')}
  end

  context 'with unsupported Ubuntu (zephyr)' do
    let(:facts) {{
        :osfamily        => 'Debian',
        :lsbdistid       => 'Ubuntu',
        :operatingsystem => 'Ubuntu',
        :lsbdistcodename => 'zephyr'
    }}
    it { is_expected.to_not compile }
  end

  context 'with supported Redhat 6' do
    let(:facts) {{
        :osfamily                  => 'RedHat',
        :operatingsystem           => 'RedHat',
        :operatingsystemmajrelease => '6'
    }}
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_package('helix-gitswarm')}
  end

  context 'with supported Redhat 7' do
    let(:facts) {{
        :osfamily                  => 'RedHat',
        :operatingsystem           => 'RedHat',
        :operatingsystemmajrelease => '7'
    }}
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_package('helix-gitswarm')}
  end

  context 'with unsupported Redhat 5' do
    let(:facts) {{
        :osfamily                  => 'RedHat',
        :operatingsystem           => 'RedHat',
        :operatingsystemmajrelease => '5'
    }}
    it { is_expected.to_not compile }
  end
end

require 'spec_helper_acceptance'

describe 'moodle class' do
  context 'with required parameters only' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = %{
        include gitswarm
      }

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes  => true)
    end

    describe port(80) do
      it { should be_listening }
    end

    describe port(1666) do
      it { should be_listening }
    end

    describe command('curl localhost/users/sign_in') do
      its(:stdout) { should contain('<h3>Log in to GitSwarm</h3>') }
    end
    
  end
end

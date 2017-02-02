require "spec_helper"

describe OmniAuth::Strategies::Pipefy do
  let(:request) { double('Request', :params => {}, :cookies => {}, :env => {}) }

  subject do
    args = ['appid', 'secret', @options || {}].compact
    OmniAuth::Strategies::Pipefy.new(*args).tap do |strategy|
      allow(strategy).to receive(:request) {
        request
      }
    end
  end

  describe 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq(:pipefy)
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://app.pipefy.com')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('/oauth/authorize')
    end
  end

  describe 'info' do
    let(:raw_info_hash) do
      {
        'username' => 'foo',
        'name' => 'Foo Bar',
        'email' => 'foo@example.com',
        'avatar_url' => 'http://gravatar.com/example'
      }
    end

    before do
      allow(subject).to receive(:raw_info).and_return(raw_info_hash)
    end

    it 'should returns the nickname' do
      expect(subject.info['username']).to eq(raw_info_hash[:username])
    end

    it 'should returns the name' do
      expect(subject.info['name']).to eq(raw_info_hash[:name])
    end

    it 'should returns the email' do
      expect(subject.info['email']).to eq(raw_info_hash[:email])
    end

    it 'should returns the avatar_url' do
      expect(subject.info['avatar']).to eq(raw_info_hash[:avatar_url])
    end
  end
end

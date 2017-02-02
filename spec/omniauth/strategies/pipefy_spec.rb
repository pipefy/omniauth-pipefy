require "spec_helper"

describe OmniAuth::Strategies::Pipefy do
  subject { OmniAuth::Strategies::Pipefy.new('appid', 'secret') }

  describe 'client options' do
    it 'has correct name' do
      expect(subject.options.name).to eq(:pipefy)
    end

    it 'has correct site' do
      expect(subject.options.client_options.site).to eq('https://app.pipefy.com')
    end

    it 'has correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('/oauth/authorize')
    end
  end

  describe 'client info' do
    let(:token_info) do
      {
        'user' => {
          'id' => 123,
          'username' => 'foo',
          'name' => 'Foo Bar',
          'email' => 'foo@example.com',
          'avatar_url' => 'http://gravatar.com/example'
        }
      }
    end
    let(:user_info) { token_info['user'] }

    before do
      allow(subject).to receive(:token_info).and_return(token_info)
    end

    it 'returns the id' do
      expect(subject.info['user_id']).to eq(user_info[:id])
    end

    it 'returns the nickname' do
      expect(subject.info['username']).to eq(user_info[:username])
    end

    it 'returns the name' do
      expect(subject.info['name']).to eq(user_info[:name])
    end

    it 'returns the email' do
      expect(subject.info['email']).to eq(user_info[:email])
    end

    it 'returns the avatar_url' do
      expect(subject.info['avatar']).to eq(user_info[:avatar_url])
    end
  end
end

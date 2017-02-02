require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Pipefy < OmniAuth::Strategies::OAuth2
      option :name, :pipefy

      option :client_options,
             site: ENV.fetch('PIPEFY_URL', 'https://app.pipefy.com'),
             authorize_url: '/oauth/authorize'

      uid { user_info['id'] }

      info do
        {
          user_id: user_info['id'],
          username: user_info['username'],
          name: user_info['name'],
          email: user_info['email'],
          avatar: user_info['avatar_url']
        }
      end

      def token_info
        @token_info ||= access_token.to_hash
      end

      def user_info
       @user_info ||= token_info['user']
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

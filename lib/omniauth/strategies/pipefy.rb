require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Pipefy < OmniAuth::Strategies::OAuth2
      option :name, :pipefy

      option :client_options,
             site: 'https://app.pipefy.com',
             authorize_url: '/oauth/authorize'

      uid { raw_info['resource_owner_id'] }

      info do
        {
          username: raw_info['username'],
          name: raw_info['name'],
          email: raw_info['email'],
          avatar: raw_info['avatar_url']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/oauth/token/info').parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

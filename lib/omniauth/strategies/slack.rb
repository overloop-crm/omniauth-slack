require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Slack < OmniAuth::Strategies::OAuth2
      option :client_options, {
        authorize_url: 'https://slack.com/oauth/authorize',
        token_url: 'https://slack.com/api/oauth.access'
      }

      def request_phase
        super
      end

      def callback_phase
        super
      end
      
      def callback_url
        full_host + script_name + callback_path
      end

      uid { raw_info['id'].to_s }
    end
  end
end

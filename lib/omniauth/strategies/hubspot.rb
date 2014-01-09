require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class HubSpot < OmniAuth::Strategies::OAuth2

      args [:client_id]

      option :name, "hubspot"
      option :provider_ignores_state, true

      option :client_options, {
        :site => 'https://app.hubspot.com',
        :authorize_url => '/auth/authenticate',
        :token_url => '/auth/authenticate'
      }

      option :authorize_options, [:scope, :portalId]

    end
  end
end

OmniAuth.config.add_camelization 'hubspot', 'HubSpot'

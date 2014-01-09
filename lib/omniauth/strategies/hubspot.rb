require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class HubSpot < OmniAuth::Strategies::OAuth

      args [:client_id]

      option :name, "hubspot"

      option :client_options, {
        :site => 'https://app.hubspot.com',
        :authorize_url => '/auth/authenticate'
      }

    end
  end
end

OmniAuth.config.add_camelization 'hubspot', 'HubSpot'

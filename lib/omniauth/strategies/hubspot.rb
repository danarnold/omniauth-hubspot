require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class HubSpot < OmniAuth::Strategies::OAuth2

      option :name, "hubspot"

      option :client_options, {:site => "https://app.hubspot.com/auth/authenticate"}

    end
  end
end
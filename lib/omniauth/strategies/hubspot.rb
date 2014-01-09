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

      def callback_phase
        raise OmniAuth::NoSessionError.new("Session Expired") if session['oauth'].nil?

        opts = {}
        if session['oauth'][name.to_s]['callback_confirmed']
          opts[:oauth_verifier] = request['oauth_verifier']
        else
          opts[:oauth_callback] = callback_url
        end

        @access_token = params[:access_token]
        @refresh_token = params[:refresh_token]
        @expires_in = params[:expires_in]
        super
      rescue ::Timeout::Error => e
        fail!(:timeout, e)
      rescue ::Net::HTTPFatalError, ::OpenSSL::SSL::SSLError => e
        fail!(:service_unavailable, e)
      rescue ::OAuth::Unauthorized => e
        fail!(:invalid_credentials, e)
      rescue ::MultiJson::DecodeError => e
        fail!(:invalid_response, e)
      rescue ::OmniAuth::NoSessionError => e
        fail!(:session_expired, e)
      end

      credentials do
        {'access_token' => @access_token, 'refresh_token' => @refresh_token, 'expires_in' => @expires_in}
      end

    end
  end
end

OmniAuth.config.add_camelization 'hubspot', 'HubSpot'

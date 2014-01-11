require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class HubSpot < OmniAuth::Strategies::OAuth2

      args [:client_id]

      option :name, "hubspot"
      option :provider_ignores_state, true

      option :client_options, {
        :site => 'https://app.hubspot.com',
        :authorize_url => '/auth/authenticate'
      }

      option :authorize_options, [:scope, :portalId]

      def callback_phase
        if request.params['error'] || request.params['error_reason']
          raise CallbackError.new(request.params['error'], request.params['error_description'] || request.params['error_reason'], request.params['error_uri'])
        end
        if !options.provider_ignores_state && (request.params['state'].to_s.empty? || request.params['state'] != session.delete('omniauth.state'))
          raise CallbackError.new(nil, :csrf_detected)
        end

        hash = {'token' = request.params[:access_token]}
        hash.merge!('refresh_token' = request.params[:refresh_token])
        hash.merge!('expires_in' = request.params[:expires_in])
        self.access_token = hash

        self.env['omniauth.auth'] = auth_hash
        call_app!
      rescue ::OAuth2::Error, CallbackError => e
        fail!(:invalid_credentials, e)
      rescue ::MultiJson::DecodeError => e
        fail!(:invalid_response, e)
      rescue ::Timeout::Error, ::Errno::ETIMEDOUT, Faraday::Error::TimeoutError => e
        fail!(:timeout, e)
      rescue ::SocketError, Faraday::Error::ConnectionFailed => e
        fail!(:failed_to_connect, e)
      end

      credentials do
        hash = {'token' => access_token['token']}
        hash.merge!('refresh_token' => access_token['refresh_token'])
        hash.merge!('expires_in' => access_token['expires_in'])
        hash
      end

    end
  end
end

OmniAuth.config.add_camelization 'hubspot', 'HubSpot'

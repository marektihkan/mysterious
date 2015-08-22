module Mysterious
  module Api
    module Authentication
      def current_user
        @current_user
      end

      def context
        @context = UserContext.new(current_user)
      end

      def authenticate
        @current_user = find_user_by_token
        unauthorised and return false unless current_user
      end

      def token
        @token ||= Tokens.parse(authorization_header, :basic)
      end

      def authorization_header
        env['HTTP_AUTHORIZATION'] || ''
      end

      private

      def find_user_by_token
        if token.valid?
          Users::Authenticate.new(token.username, token.password).call
        else
          Users::Visitor
        end
      end
    end
  end
end

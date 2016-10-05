module Mysterious
  module Users
    class Authenticate
      include Finders::ByEmail

      def initialize(username, password)
        @username = username
        @password = password
      end

      def call
        if user && user.valid_password?(password)
          user
        end
      end

      private

      attr_reader :username, :password

      def user
        @user ||= find_user(username)
      end
    end
  end
end

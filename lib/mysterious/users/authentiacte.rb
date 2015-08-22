module Mysterious
  module Users
    class Authenticate
      def initialize(username, password)
        @username = username
        @password = password
      end

      def call
        return unless user

        user.extend(PasswordAuthenticable)
        return unless user.valid_password?(password)
        user
      end

      private

      attr_reader :username, :password

      def user
        @user ||= find_user
      end

      def find_user
        Models::User.find_by(email: username)
      end
    end
  end
end

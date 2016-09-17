module Mysterious
  module Users
    class Authenticate
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
        @user ||= find_user
      end

      def find_user
        Users::User.find_by(email: username)
      end
    end
  end
end

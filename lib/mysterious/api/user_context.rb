module Mysterious
  module Api
    class UserContext
      include Spine::Authorisation::Context

      attr_reader :user

      alias :subject :user

      def initialize(user)
        @user = user
      end

      def role
        subject.role
      end
    end
  end
end

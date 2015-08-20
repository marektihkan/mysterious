module Mysterious
  module Api
    class UserContext
      include Spine::Authorisation::Context

      attr_reader :subject

      def initialize(user)
        @subject = user
      end

      def role
        subject.role
      end
    end
  end
end

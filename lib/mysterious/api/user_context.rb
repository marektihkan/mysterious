module Mysterious
  module Api
    class UserContext
      include Spine::Authorisation::Context

      attr_reader :user

      alias :subject :user

      def initialize(user)
        @user = user
        extend_context_by_role
      end

      def role
        subject.role
      end

      private

      def extend_context_by_role
        if role == 'admin'
          extend(Admin)
        else
          extend(User)
        end
      end

      module Admin
        def tasks
          Tasks::Task
        end
      end

      module User
        def tasks
          user.tasks
        end
      end
    end
  end
end

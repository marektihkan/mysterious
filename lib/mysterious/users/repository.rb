module Mysterious
  module Users
    class Repository
      include Spine::Hub::Publisher

      def find(identity)
        user = users.find_by(id: identity)
        if user
          publish(:user_found, user)
        else
          publish(:user_not_found, identity)
        end
        user
      end

      def all
        result = users.all
        publish(:users_found, result)
        result
      end

      private

      def users
        Users::User
      end
    end
  end
end

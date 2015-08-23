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

      private

      def users
        Models::User
      end
    end
  end
end

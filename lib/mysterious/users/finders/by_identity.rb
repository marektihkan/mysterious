module Mysterious
  module Users
    module Finders
      module ByIdentity
        def find_user(identity)
          user = users.find_by(id: identity)
          publish(:user_not_found, context, identity) unless user
          user
        end

        private

        def users
          Users::User
        end
      end
    end
  end
end

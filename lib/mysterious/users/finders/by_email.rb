module Mysterious
  module Users
    module Finders
      module ByEmail
        def find_user(email)
          user = users.find_by(email: email)
          publish(:user_not_found, context, email) unless user
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

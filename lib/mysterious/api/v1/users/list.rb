module Mysterious
  module Api
    module V1
      module Users
        class List < Action
          def action
            service = Mysterious::Users::Repository.new
            service.subscribe(self)
            service.all
          end

          def on_users_found(users)
            success(serialize_all(users, :user))
          end
        end
      end
    end
  end
end

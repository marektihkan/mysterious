module Mysterious
  module Api
    module V1
      module Users
        class Details < Action
          def action
            service = Users::Finder.new
            service.subscribe(self)
            service.call(parameters[:id])
          end

          def on_user_not_found(identity)
            not_found
          end

          def on_user_found(user)
            success(serialize(:user, user))
          end
        end
      end
    end
  end
end


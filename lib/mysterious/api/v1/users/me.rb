module Mysterious
  module Api
    module V1
      module Users
        class Me < Action
          before :authenticate

          def action
            success(serialize(current_user, :user))
          end
        end
      end
    end
  end
end

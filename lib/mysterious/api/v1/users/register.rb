module Mysterious
  module Api
    module V1
      module Users
        class Register < Action
          def action
            service = Mysterious::Users::Register.new
            service.subscribe(self)
            service.call(parameters.symbolized)
          end

          def on_registration_failed(user)
            validation_failed(user.errors)
          end

          def on_registered(user)
            success(serialize(user, :user))
          end
        end
      end
    end
  end
end

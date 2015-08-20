module Mysterious
  module Users
    class Register
      include Spine::Hub::Publisher

      def call(attributes)
        user = Models::User.new(attributes)
        if user.save
          publish(:registerd, user)
        else
          publish(:registration_failed, user)
        end
        user
      end
    end
  end
end

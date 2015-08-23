module Mysterious
  module Users
    class Register
      include Spine::Hub::Publisher

      def call(attributes)
        user = Models::User.new(filter(attributes))
        if user.save
          publish(:registered, user)
        else
          publish(:registration_failed, user)
        end
        user
      end

      private

      def filter(attributes)
        Filter.transform(attributes)
      end

      Filter = Spine::Transform.define do
        copy :name
        copy :email
        copy :password
      end
    end
  end
end

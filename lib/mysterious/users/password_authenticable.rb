module Mysterious
  module Users
    module PasswordAuthenticable
      def password
        @password
      end

      def password=(value)
        @password = value
        self.password_hash = Passwords.hash(value) if value
      end

      def valid_password?(password)
        Passwords.compare(password, password_hash)
      end
    end
  end
end

module Mysterious
  module Users
    module PasswordAuthenticable
      def password
        @password
      end

      def password=(value)
        @password = value
        self.passwor_hash = Passwords.hash(value) if value
      end

      def valid_password?(password)
        Passwords.compare(password, passwor_hash)
      end
    end
  end
end

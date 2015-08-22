require 'bcrypt'

module Mysterious
  module Users
    module Passwords
      extend self

      def pepper=(value)
        @pepper = value
      end

      def pepper
        @pepper ||= ''
      end

      def stretches=(value)
        @stretches = value
      end

      def stretches
        @stretches || 10
      end

      def hash(password)
        ::BCrypt::Password.create(
          "#{ password }#{ pepper }",
          cost: stretches
        ).to_s
      end

      def compare(password, hash)
        bcrypt = ::BCrypt::Password.new(hash)
        password_hash = ::BCrypt::Engine.hash_secret(
          "#{ password }#{ pepper }",
          bcrypt.salt
        )
        secure_compare(password_hash, hash)
      end

      private

      def secure_compare(a, b)
        return false if different_size?(a, b)
        l = a.unpack "C#{a.bytesize}"

        result = 0
        b.each_byte { |byte| result |= byte ^ l.shift }
        result == 0
      end

      def different_size?(a, b)
        a.strip.length == 0 || b.strip.length == 0 || a.bytesize != b.bytesize
      end
    end
  end
end

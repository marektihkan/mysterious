module Mysterious
  module Api
    module Tokens
      class BasicToken
        def self.parse(token)
          new(Base64.decode64(token).split(':'))
        end

        attr_reader :username, :password

        def initialize(data)
          @username = data[0]
          @password = data[1]
        end

        def valid?(time = Time.now)
          !!(username && password)
        end

        def verify(password)
          self.password == password
        end
      end
    end
  end
end

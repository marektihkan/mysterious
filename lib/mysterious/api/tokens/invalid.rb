module Mysterious
  module Api
    module Tokens
      module InvalidToken
        extend self

        def valid?(time = nil)
          false
        end

        def verify(*arguments)
          false
        end

        def parse(token)
          self
        end
      end
    end
  end
end

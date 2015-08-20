module Mysterious
  module Api
    module Tokens
      extend self

      def parse(token_with_scheme, scheme)
        type, token = token_with_scheme.split(' ')
        parser_for(verify_scheme(type, scheme)).parse(token)
      end

      def verify_scheme(type, expected)
        parsed_scheme = (type || '').downcase.to_sym
        return nil unless parsed_scheme == expected
        parsed_scheme
      end

      def parser_for(scheme)
        ALL.fetch(scheme, InvalidToken)
      end

      ALL = {
        basic: BasicToken
      }
    end
  end
end

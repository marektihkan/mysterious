module Mysterious
  module Api
    module ContextResponses
      def on_denied(context, action, resource)
        unauthorised
      end
    end
  end
end

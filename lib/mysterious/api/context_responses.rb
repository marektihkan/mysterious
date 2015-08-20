module Mysterious
  module Api
    module ContextResponses
      def on_denied(context, action, resource)
        forbidden
      end
    end
  end
end

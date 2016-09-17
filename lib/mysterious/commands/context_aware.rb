module Mysterious
  module Commands
    class ContextAware
      include Spine::Hub::Repeater

      attr_reader :context

      def initialize(context)
        @context = context
        context.subscribe(self)
      end
    end
  end
end

module Mysterious
  module Commands
    class Command
      include Spine::Hub::Repeater

      attr_reader :context

      def initialize(context)
        @context = context
        context.subcribe(self)
      end
    end
  end
end

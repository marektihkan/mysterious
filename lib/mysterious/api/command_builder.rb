module Mysterious
  module Api
    module CommandBuilder
      def command(klass)
        service = klass.new(context)
        service.subscribe(self)
        service
      end
    end
  end
end

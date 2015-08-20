module Mysterious
  module Api
    module DefaultFormat
      def format
        Spine::ContentTypes::Json
      end
    end
  end
end

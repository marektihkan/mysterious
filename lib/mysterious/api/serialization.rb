module Mysterious
  module Api
    module Serialization
      def serialize(model, *mappings)
        Serializers.find(*mappings).map(model)
      end

      def serialize_all(models, *mappings)
        Serializers.find(*mappings).map_all(models)
      end
    end
  end
end

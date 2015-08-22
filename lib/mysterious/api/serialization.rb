module Mysterious
  module Api
    module Serialization
      def serialize(model, *mappings)
        V1::Serializers.find(*mappings).map(model)
      end

      def serialize_all(models, *mappings)
        V1::Serializers.find(*mappings).map_all(models)
      end
    end
  end
end

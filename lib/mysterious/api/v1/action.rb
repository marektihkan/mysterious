module Mysterious
  module Api
    module V1
      class Action < Spine::Actions::Action
        include Spine::Hub::Subscriber
        include Responses
        include Authentication

        def format
          Spine::ContentTypes::Json
        end

        def serialize(model, *mappings)
          Serializers.find(*mappings).map(model)
        end

        def serialize_all(models, *mappings)
          Serializers.find(*mappings).map_all(models)
        end
      end
    end
  end
end

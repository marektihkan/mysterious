module Mysterious
  module Api
    module V1
      class Action < Spine::Actions::Action
        include Spine::Hub::Subscriber
        include Spine::Routing::Parameters
        include Spine::Parameters::Action
        include Responses
        include Authentication
        include Serialization
        include DefaultFormat
        include ContextResponses
      end
    end
  end
end

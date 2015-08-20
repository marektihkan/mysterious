module Mysterious
  module Api
    module V1
      class Action < Spine::Actions::Action
        include Spine::Hub::Subscriber
        include Responses
        include Authentication
        include Serialization
        include DefaultFormat
      end
    end
  end
end

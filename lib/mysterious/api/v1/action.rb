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
      end
    end
  end
end

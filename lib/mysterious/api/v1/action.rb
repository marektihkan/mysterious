module Mysterious
  module Api
    module V1
      class Action < Spine::Actions::Action
        def format
          Spine::ContentTypes::Json
        end
      end
    end
  end
end

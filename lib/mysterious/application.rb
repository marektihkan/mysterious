module Mysterious
  module Application
    extend Spine::Engines::Application
    extend self

    extension Spine::Routing::Engine
    extension Spine::Authorisation::Engine
    extension Spine::Logging::Engine

    def active_record
      ::ActiveRecord::Base
    end

    def passwords
      ::Mysterious::Users::Passwords
    end
  end
end

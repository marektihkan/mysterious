module Mysterious
  module Api
    module V1
      module Serializers
        define :user do
          integer :id
          string :name
          string :email
          timestamp :created_at
          timestamp :updated_at
        end
      end
    end
  end
end

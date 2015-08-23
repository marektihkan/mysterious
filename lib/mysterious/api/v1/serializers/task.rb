module Mysterious
  module Api
    module V1
      module Serializers
        define :task do
          string :name
          date :due
          boolean(:completed) { |source| !!source.completed_at }
          integer :user_id
          timestamp :created_at
          timestamp :updated_at
        end
      end
    end
  end
end

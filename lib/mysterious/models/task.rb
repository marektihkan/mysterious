module Mysterious
  module Models
    class Task < ActiveRecord::Base
      self.table_name = 'tasks'

      belongs_to :user

      validates :name, presence: true, length: { maximum: 255 }
    end
  end
end

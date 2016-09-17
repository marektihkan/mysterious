module Mysterious
  module Tasks
    class Task < ActiveRecord::Base
      self.table_name = 'tasks'

      belongs_to :user,
        class_name: 'Users::User',
        foreign_key: 'user_id'

      validates :name, presence: true, length: { maximum: 255 }
    end
  end
end

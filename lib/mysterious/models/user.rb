module Mysterious
  module Models
    class User < ActiveRecord::Base
      include Users::PasswordAuthenticable

      self.table_name = 'users'

      has_many :tasks

      validates :name, presence: true, length: { maximum: 255 }
      validates :email,
        presence: true,
        uniqueness: true,
        format: {
          with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
          message: "format is invalid"
        }
      validates :role, presence: true, inclusion: { in: %w( user admin ) }
      validates :password, presence: true, if: :new_record?
      validates :password, length: { in: 6..100, allow_nil: true }
    end
  end
end

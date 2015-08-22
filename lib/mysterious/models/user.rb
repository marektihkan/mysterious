module Mysterious
  module Models
    class User < ActiveRecord::Base
      self.table_name = 'users'
    end
  end
end

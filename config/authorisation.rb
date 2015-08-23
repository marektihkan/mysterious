module Mysterious
  module Application
    authorisation.permissions.define('user')
      .grant(:all, :all)

    authorisation.permissions.define('admin')
      .grant(:all, :all)
  end
end

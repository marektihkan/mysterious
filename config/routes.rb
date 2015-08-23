module Mysterious
  Application.routes do
    scope :v1 do
      post :register, to: Api::V1::Users::Register
      get :me, to: Api::V1::Users::Me

      scope :users do
        get '', to: Api::V1::Users::List
        get ':id', to: Api::V1::Users::Details
      end

      scope :tasks do
        get '', to: Api::V1::Tasks::List
        get ':id', to: Api::V1::Tasks::Details
      end
    end
  end
end

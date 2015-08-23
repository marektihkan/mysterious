module Mysterious
  Application.routes do
    scope :v1 do
      post :register, to: Api::V1::Users::Register
      get :me, to: Api::V1::Users::Me

      scope :users do
        get ':id', to: Api::V1::Users::Details
      end
    end
  end
end

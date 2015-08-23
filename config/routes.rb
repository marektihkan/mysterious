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
        post '', to: Api::V1::Tasks::Add

        get ':id', to: Api::V1::Tasks::Details
        put ':id', to: Api::V1::Tasks::Update
        patch ':id', to: Api::V1::Tasks::Update
      end
    end
  end
end

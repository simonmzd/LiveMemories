Rails.application.routes.draw do
  devise_for :users
  root "pages#landing"
  get "auth", to: "pages#auth"
  

  resources :concerts, only: %i[index show new create] do
    resources :contents do
      resources :votes, only: %i[create destroy update]
      resources :comments, only: %i[create destroy new update]
    end
    resources :participations, only: %i[create destroy]
  end
end

Rails.application.routes.draw do
  devise_for :users
  root "pages#landing"
  get "auth", to: "pages#auth"
  get "dashboard", to: "pages#dashboard"

  resources :concerts do
    resources :contents do
      resources :votes, only: %i[create destroy update]
      resources :reviews, only: %i[create destroy new update]
    end
    resources :participations, only: %i[create destroy]
  end
end

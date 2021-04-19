Rails.application.routes.draw do

  root "application#index"

  namespace :api do
    namespace :v1 do
      resources :users
      post "login", to: "authentication#login"
      resources :creditcards
      resources :fixedexpenses
      resources :variableexpenses
      resources :loans
      resources :dave
    end
  end

  # get '*path', to: "pages#index", via: :all
end




Rails.application.routes.draw do

  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :users
      post "login", to: "authentication#login"
      resources :creditcards
      resources :fixedexpenses
      resources :nonfixedexpenses
      resources :loans
      resources :dave
    end
  end

  get '*path', to: "pages#index", via: :all
end




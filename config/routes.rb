Rails.application.routes.draw do

  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :users
      post "login", to: "authentication#login"
      resources :credit_cards
      resources :fixed_expenses
      resources :non_fixed_expenses
      resources :loans
    end
  end

  get '*path', to: "pages#index", via: :all
end




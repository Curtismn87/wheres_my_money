Rails.application.routes.draw do
  root 'stores#index'
  devise_for :users
  resources :stores do
    resources :items
  end

  # AM: Interesting! I like how budget uses a combination of CRUD and custom routes.

  get "/budget", to: "budgets#show"
  get "/budget/check", to: "budgets#check"
  get "/about", to: "about#show"
end

Rails.application.routes.draw do
  resources :stores do
    resources :items
  end

  get "/budget", to: "budgets#show"
  get "/budget/check", to: "budgets#check"
  get "/about", to: "about#show"
end

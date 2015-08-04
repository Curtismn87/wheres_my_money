Rails.application.routes.draw do
  resources :stores do
    resources :items
  end

  get "/budget", to: "budgets#show"
  post "/budget/check", to: "budgets#check"
end

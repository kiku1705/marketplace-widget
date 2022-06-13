Rails.application.routes.draw do
  resources :transctions
  resources :widgets
  resources :users do
    post :add_money, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

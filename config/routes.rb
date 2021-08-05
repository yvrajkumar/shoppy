Rails.application.routes.draw do
  resources :orders
  resources :products
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root "home#index"
  get "product_details/:id", to: "product_details#index"
  post "customerorder/new", to: "customerorder#new"
  get "/customerorder/show", to: "customerorder#show"
  post "/customerorder/cancel", to: "customerorder#cancel"
  get "/deliverydetails/update", to: "deliverydetails#show"
  post "/deliverydetails/update", to: "deliverydetails#update"
  get "/mencategory/shirt", to: "mencategory#index"
  get "/mencategory/tshirt", to: "mencategory#index"
  get "/mencategory/jeans", to: "mencategory#index"
  get "/mencategory/pant", to: "mencategory#index"
  get "/womencategory/dress", to: "womencategory#index"
  get "/womencategory/frock", to: "womencategory#index"
  get "/womencategory/top", to: "womencategory#index"
  get "/womencategory/legging", to: "womencategory#index"
  get "/search", to: "search#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  default_url_options :host => "localhost:3000"
end

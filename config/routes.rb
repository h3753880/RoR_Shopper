Rails.application.routes.draw do
  get 'access/new', as: 'login'

  post 'access/create'

  delete 'access/destroy', as: 'logout'

  get 'admin/index', as: 'admin'

  resources :users
  resources :orders
  resources :lineitems
  resources :carts

  root "shopper#index", as: 'root'

  get 'shopper' => "shopper#index"

  get 'products/search' => "products#search"

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'shopper/search'
end

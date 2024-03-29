Rails.application.routes.draw do
  devise_for :users
  root to: "pages#landing", locale: "ro"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/homepage', to: "pages#home"
  resources :users, only: [:new, :create]
  resources :customers, only: [:index, :show, :new, :create, :edit, :update]
  resources :restaurants, only: [:index, :show, :new, :create, :edit, :update] do
    resources :menus, only: [:index, :show, :new, :create, :edit, :update]
  end
  resources :menus, only: [:index, :show] do
    resources :menu_items, only: [:index, :show, :create, :new, :update]
  end
  resources :orders, only: [:index, :show, :new, :create]
  resources :shopping_carts, only: [:new, :create] do
    resources :shopping_cart_items, only: [:new, :create, :delete]
  end
  resources :order_items, only: [:update, :edit]
  patch "finalize_shopping_cart/:locale", to: "shopping_carts#finalize", as: "finalize_shopping_cart"
  patch "remove_form_shopping_cart", to: "shopping_carts#remove", as: "remove_form_shopping_cart"
  get "shopping_carts/:dish_id/quantity", to: "shopping_carts#quantity"
  get '/shopping_cart_items', to: 'shopping_carts#items'
  post '/orders/:id/send_email/:locale', to: 'orders#send_email', as: 'send_email'
  post '/contacts/:locale', to: 'contacts#create', as: 'contacts'
  get '/contacts/:locale', to: 'contacts#new', as: 'new_contact'
  post '/reservations/:locale', to: 'reservations#create', as: 'reservations'
  get '/reservations/:locale', to: 'reservations#new', as: 'new_reservation'
  resources :shopping_cart_items, only: [:update, :edit]


end

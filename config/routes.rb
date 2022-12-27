Rails.application.routes.draw do
  devise_for :users
  root to: "pages#landing"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/homepage', to: "pages#home"
  resources :users, only: [:new, :create]
  resources :customers, only: [:index, :show, :new, :create, :edit, :update] do
    resources :orders, only: [:index, :show, :new, :create]
  end
  resources :restaurants, only: [:index, :show, :new, :create, :edit, :update] do
    resources :menus, only: [:index, :show, :new, :create, :edit, :update]
  end
  resources :menus, only: [:index, :show] do
    resources :menu_items, only: [:index, :show]
  end
  resources :orders, only: [] do
    resources :order_items, only: [:index, :show, :new, :create, :edit, :update]
  end
  resources :reservations, only: [:index, :show, :new, :create, :edit, :update]
  resources :contacts, only: [:create, :new]
end

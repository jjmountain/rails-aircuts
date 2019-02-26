Rails.application.routes.draw do
  get 'shops/index'
  get 'shops/show'
  get 'shops/new'
  get 'shops/create'
  get 'shops/edit'
  get 'shops/update'
  devise_for :shops
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shops, only: [ :index, :new, :create, :edit, :update, :show ] do
    resources :appointments, only: [ :new, :create  ]
  end
  resources :appointments, only: [ :index, :destroy ]
end

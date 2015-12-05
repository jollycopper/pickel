Rails.application.routes.draw do

  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'search' => 'course_select#search'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'cart/checkout', to: 'carts#checkout'
  get 'cart', to: 'carts#index'
  get 'cart/:id', to: 'carts#add'
  delete 'cart/:id', to: 'carts#remove'

  resources :users
  resources :courses
end

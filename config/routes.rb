Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :meetings
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  get   '/logout',   to: 'sessions#destroy'
  root  'users#index'
end

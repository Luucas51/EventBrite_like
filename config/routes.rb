Rails.application.routes.draw do
  root to: 'events#index'
  resources :events, only: [:show, :create, :index, :new]
  devise_for :users
  resources :users, only: [:show]
  resources :events do
    resources :charges
    resources :attendances
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

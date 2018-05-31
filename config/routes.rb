Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  root to: 'experiences#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :experiences do
    resources :bookings, only: [:new, :create, :destroy]
  end
  resources :bookings, only: [:index]
end

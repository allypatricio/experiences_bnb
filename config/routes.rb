Rails.application.routes.draw do
  root to: 'experiences#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :experiences
end

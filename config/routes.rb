Rails.application.routes.draw do
  devise_for :users
  resources :drinks
  root 'drinks#index'
end

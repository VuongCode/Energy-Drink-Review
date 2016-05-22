Rails.application.routes.draw do
  resources :drinks
  root 'drinks#index'
end

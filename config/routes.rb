Rails.application.routes.draw do
  devise_for :users

  resources :drinks do
    resources :reviews
  end

  root 'drinks#index'

end

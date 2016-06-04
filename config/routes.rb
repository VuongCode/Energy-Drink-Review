Rails.application.routes.draw do
  devise_for :users

  resources :drinks do
    resources :reviews do
      resources :votes, only: [:create, :destroy]
    end
  end

  root 'drinks#index'

end

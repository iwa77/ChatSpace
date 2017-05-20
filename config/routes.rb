Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users
  resources :groups, except: [:show, :destroy] do
    resources :messages, only: [:index, :create]
    collection do
       get 'search'
    end
  end
end

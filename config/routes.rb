Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home/top'
  get 'home/about'
  root 'home#top'

  get 'favorite', to: 'users#favorite'

  resource :users, only: [:show, :edit, :update]
  resources :recipes do
  	resource :favorites, only: [:create, :destroy]
  end
  resources :bookmarks, only: [:new, :create, :show, :edit, :update, :destroy]

end

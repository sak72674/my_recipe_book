Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home/top'
  get 'home/about'
  root 'home#top'

  resource :users, only: [:show, :edit, :update]
  resources :recipes do
  	resources :images, only: [:create, :update, :destroy]
  	resource :favorites, only: [:create, :destroy]
  	resources :steps, only: [:create, :update, :destroy] do
  		resources :images, only: [:create, :update, :destroy]
  	end
  	resources :ingredients, only: [:create, :update, :destroy]
  end
  resources :bookmarks, only: [:new, :create, :show, :edit, :update, :destroy]

end

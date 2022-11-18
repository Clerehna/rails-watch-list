Rails.application.routes.draw do
  # get 'bookmarks/new', to: 'bookmarks/new'
  # post 'bookmarks', to: 'bookmarks/create'
  # delete 'bookmarks/:id', to: 'bookmarks/destroy'

  # get 'lists', to: 'lists#index'
  # get 'lists/new', to: 'lists#new'
  # get 'lists/:id', to: 'lists#show', as: 'list'
  # post 'lists', to: 'lists#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :lists, only: [:index, :new, :show, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end

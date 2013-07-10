CatRental::Application.routes.draw do
  # Great: post 'cats' => 'cats#create', as: 'create_cat'

  resources :cats
  resources :cat_rental_requests
  resources :users, :only => [:show, :create, :new, :index]
  resources :sessions, :only => [:new, :create]

end

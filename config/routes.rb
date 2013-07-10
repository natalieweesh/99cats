CatRental::Application.routes.draw do
  # Great: post 'cats' => 'cats#create', as: 'create_cat'

  resources :cats, :only => [:index, :show, :new, :edit, :create]
end

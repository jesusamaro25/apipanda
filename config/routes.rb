Rails.application.routes.draw do

  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/postByUser' => 'search#postByUser' #busca todos los  post de un usuario especifico
  post '/bananasenpijamas'=> 'users#follow'
  post '/folllowing'=> 'followings#follow' 
  get '/numfollowers'=> 'users#numFollowers' 

  resources :followeds
  resources :followings
  resources :posts
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

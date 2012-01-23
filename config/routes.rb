Flix::Application.routes.draw do
  match '/my_movies' => 'my_movies#index'
  
  resources :movies
  
  match '/auth/netflix/callback', :to => 'sessions#create_netflix'
  match '/auth/facebook/callback', :to => 'sessions#create_facebook'
  match '/auth/failure', :to => 'sessions#failure'
  
  match '/import', :to => 'import#index'
  match '/am', :to => 'import#add_movies'
  
  root :to => 'home#index'

end

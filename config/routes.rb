Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   resources :users
   get '/user_location', to: 'users#user_location'
   root to: "users#new"

end

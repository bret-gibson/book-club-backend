Rails.application.routes.draw do

  resources :posts
  post '/login', to: 'auth#create'
  get '/decode_token', to: 'users#profile'
   #given a token, find the authenticated user
  resources :group_users
  resources :books
  resources :group_books
  resources :users
  resources :groups
end

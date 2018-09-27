Rails.application.routes.draw do
  root to: "static_pages#home"
  post '/admin/movies/:id', to: 'admin/movies#update'
  post '/signup',  to: 'users#create'

  namespace :admin do
    resources :movies,:theatres,:shows
  end

  get 'movies/index'
  get 'movies/show'
  #match '/tickets/new', to: 'tickets/create', via: [:post]
  #post 'tickets/create' ,as 'new_ticket'
  resources :tickets

  get 'movies/add_movie_interest'
  get 'admin/movies/change_status/:id', to: 'admin/movies#change_status' ,as: 'admin/movies/change_status'
  resources :movies
  resources :movies
  resources :reviews
  resources :shows
  resources :theatres

  get 'static_pages/home'
  get 'static_pages/help'
  devise_for :users

  resources :users
  resources :static_pages
end

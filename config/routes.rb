# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static_pages#home'
  post '/admin/movies/:id', to: 'admin/movies#update'
  get '/admin/shows/search', to: 'admin/shows#search'
  post '/admin/shows/:id', to: 'admin/shows#update'
  post '/admin/theatres/:id', to: 'admin/theatres#update'
  get '/add_movie_interest', to: 'movie_interests#create'

  namespace :admin do
    resources :movies, :theatres, :shows
    resources :dashboards, only: [:index]
  end

  resources :tickets
  resources :movie_interests
  get 'admin/movies/change_status/:id', to: 'admin/movies#change_status', as: 'admin/movies/change_status'
  resources :movies
  resources :reviews
  resources :shows
  resources :theatres

  get 'static_pages/home'
  get 'static_pages/help'

  devise_for :users, controllers: { registrations: 'myregistrations' }

  post '/users/activate_account', to: 'users#activate_account_mail'
  get '/users/activate_user_account/:email', to: 'users#activate_user_account', as: 'activate_user_account'
  resources :users do
    get 'activate_account', to: 'users#activate_account', on: :collection
  end
end
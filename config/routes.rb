Rails.application.routes.draw do
  root to: 'static_pages#home'
  post '/admin/movies/:id', to: 'admin/movies#update'
  post '/admin/shows/:id', to: 'admin/shows#update'
  post '/admin/theatres/:id', to: 'admin/theatres#update'
  get '/add_movie_interest', to: 'movie_interests#create' #post 
  get 'admin/movies/change_status/:id', to: 'admin/movies#change_status', as: 'admin/movies/change_status' #post

  namespace :admin do
    resources :movies, :theatres, :shows
    resources :dashboards, only: [:index]
  end

  resources :movies, only: [:index, :show]
  resources :tickets, except: [:new, :edit, :update]
  resources :movie_interests, except: [:new, :edit, :update]
  resources :reviews, except: [:new, :edit, :update]
  get 'static_pages/home'
  get 'static_pages/help'

  devise_for :users, controllers: { registrations: 'myregistrations' }

  post '/users/activate_account', to: 'users#activate_account_mail' #
  get '/users/activate_user_account/:email', to: 'users#activate_user_account', as: 'activate_user_account' #should be post
  resources :users do
    get 'activate_account', to: 'users#activate_account', on: :collection
  end
end
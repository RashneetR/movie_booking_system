Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'static_pages/help'
  
  namespace :admin do
    resources :movies do
      post 'change_status', on: :member
    end
    resources :theatres, :shows
    resources :dashboards, only: [:index]
  end

  resources :movies, only: [:index, :show]
  resources :tickets, :movie_interests, except: [:new, :edit, :update]
  resources :reviews, except: [:edit, :update]
  devise_for :users, controllers: { registrations: 'myregistrations' }

  post '/users/activate_account', to: 'users#activate_account_mail' #
  get '/users/activate_user_account/:email', to: 'users#activate_user_account', as: 'activate_user_account' #should be post
  resources :users do
    get 'activate_account', to: 'users#activate_account', on: :collection
  end
end
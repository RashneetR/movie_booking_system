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

  resources :movies, only: %i[index show]
  resources :tickets, :movie_interests, except: %i[new edit update]
  resources :reviews, except: %i[edit update]
  devise_for :users, controllers: { registrations: 'myregistrations' }

  resources :users do
    get 'activate_user_account', on: :collection
    member do
      get 'activate_account'
      post 'activate_account_mail'
    end
  end
end

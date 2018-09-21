Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  devise_for :users# controllers: { 
    #sessions: 'users/sessions'
  #} 
  resources :users
  resources :movies
  resources :theatres
  resources :static_pages

  root to: "static_pages#home"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

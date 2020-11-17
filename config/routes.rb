Rails.application.routes.draw do
  devise_for :users
  
  get 'about', to: 'pages#about'
  
  resources :articles
  
  resources :categories, except: [:destroy]
  get 'appointment/:id', to: 'appointment#show', as: 'appointment_show'
  post 'appointment/create'
  get 'lawyers', to: 'lawyer#index'
  get 'lawyer/:id', to: 'lawyer#show', as: 'lawyer_show'
  get 'client/new'
  get 'client/logout'
  post 'client/create'

  root 'pages#home'
end

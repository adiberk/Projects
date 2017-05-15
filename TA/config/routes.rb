Rails.application.routes.draw do
  devise_for :users

  resources :enrollment_tas
  resources :appointments
  resources :officehours
  resources :courses
  resources :enrollments
  resources :users
  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end
  
  root 'users#show'

  mount ActionCable.server => '/cable'

  get 'home/index'
  get 'chat/index'

  get '/about', to: 'static_pages#about'
  get '/talist',   to: 'enrollment_tas#talist'
  get '/talist/filter',   to: 'enrollment_tas#talistfilter'
  get '/talist/filter2',   to: 'enrollment_tas#talistfilter2'
  get '/taprofile',   to: 'users#taprofile'
  post '/taprofile',   to: 'users#taprofile'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/confirm_appointment', to: 'appointments#confirm_app'
  post '/unconfirm_appointment', to: 'appointments#unconfirm_app'
  post '/request_appointment', to: 'appointments#request_app'
  patch '/update_hours', to: 'officehours#update'
  get '/go_online', to: 'users#go_online'
  get '/go_offline', to: 'users#go_offline'
  get '/ta', to: 'reviews#index'

  # get '/confirm_appointment', to: 'appointments#confirm_app'
end

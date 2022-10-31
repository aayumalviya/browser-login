Rails.application.routes.draw do
  default_url_options host: "localhost:3000"
  get 'passwords/index'
  root to: 'users#index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # get 'registrations/new'
  # get 'registrations/create'
  # get 'registrations/destroy'
  
  get '/signup', to: 'registrations#new'
  post '/registrations', to: 'registrations#create'
  # patch '/registrations', to: 'registrations#update'
#  resources :registrations
 resources :users do
   get 'edit_password' 
   post 'update_password' 
 end 
#  get '/forget_password' => 'users#forget_password'
  get '/forget_password' => 'passwords#new'
  post '/forget_password' => 'passwords#create'
  # get '/change_my_password/:id' => 'passwords#edit'
  # put 'change_my_password/:id' => 'passwords#update'
  # resources :passwords
  
  get '/login' => 'sessions#new'
  get '/otp' => 'sessions#otp'
  post '/check_otp' => 'sessions#check_valid_otp'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

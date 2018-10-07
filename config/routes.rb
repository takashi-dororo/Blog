Rails.application.routes.draw do
  root   'static_pages#home'

  get    'static_pages/home'
  get    '/login',           to: 'sessions#new'
  post   '/login',           to: 'sessions#create'
  delete '/logout',          to: 'sessions#destroy'
  resources :users
end

#signup_pathを使用した方が良いのか？
#get '/signup', to: 'users#new' && post '/signup', to: 'users#create'

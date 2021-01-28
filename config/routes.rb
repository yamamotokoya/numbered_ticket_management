Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/time_table', to: 'viewing_times#show_time_table'
  get '/reserve/:id', to: 'viewing_times#reserve', as: 'reserve'
  resources :users
  namespace :admin do
    resources :users
    resources :viewing_times
    get '/today_viewing_time', to: 'viewing_times#today_viewing_time'
  end
end

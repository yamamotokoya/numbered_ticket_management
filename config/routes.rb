Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users, only: [:show, :new, :create, :index]
  resources :viewing_times
  get '/time_table', to: 'viewing_times#show_time_table'
  get '/reserve/:id', to: 'viewing_times#reserve', as: 'reserve'
end

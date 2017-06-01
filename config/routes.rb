Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'clients#start'
  get '/start', to: 'clients#start', as: 'start'
  get '/search', to: 'clients#search', as: 'search'
  get '/all', to: 'clients#all', as: 'all'
  post '/upload', to: 'clients#upload', as: 'upload'
  post '/facebook', to: 'clients#facebook', as: 'facebook'
  post '/delete', to: 'clients#delete', as: 'delete'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'clients#start'
  get '/start', to: 'clients#start', as: 'start'
end

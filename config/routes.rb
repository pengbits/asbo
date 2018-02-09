Rails.application.routes.draw do
   get 'platforms', to: 'platforms#index'
  post 'platforms', to: 'platforms#create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   get 'platforms/:key', to: 'platforms#show', as: 'platform'
   get 'platforms/:key/episodes', to: 'platforms#show_with_episodes', as: 'platform_with_episodes'
  # should prolly be PUT or POST 
  # since it creates episodes but platform exists
   get 'platforms/:key/refresh', to: 'platforms#refresh', as: 'platform_refresh'
end

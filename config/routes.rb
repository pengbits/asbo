Rails.application.routes.draw do
   get 'platforms', to: 'platforms#index'
  post 'platforms', to: 'platforms#create'
  
   get 'platforms/:key', to: 'platforms#show', as: 'platform'
  # this should prolly be PUT or POST since it creates episodes but platform exists
   get 'platforms/:key/refresh', to: 'platforms#refresh', as: 'platform_refresh'
end

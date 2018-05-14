Rails.application.routes.draw do
   get 'platforms', to: 'platforms#index' 
  post 'platforms', to: 'platforms#create', as: 'create_platform'
  
   get 'platforms/:nickname', to: 'platforms#show', as: 'platform'
delete 'platforms/:nickname/episodes', to: 'platforms#delete_episodes', as: 'delete_platform_episodes'
delete 'platforms/:nickname', to: 'platforms#destroy', as: 'delete_platform'
   put 'platforms/:nickname', to: 'platforms#update', as: 'update_platform'

  # this should prolly be PUT or POST since it creates episodes but platform exists
   get 'platforms/:nickname/refresh', to: 'platforms#refresh', as: 'platform_refresh'
   get 'platforms/:nickname/refresh/page/:page', to: 'platforms#refresh', as: 'platform_refresh_paginated'
   
   get 'episodes', to: 'episodes#index'
   get 'episodes/:id', to: 'episodes#show', as: 'episode'
   get 'episodes/filter/:filter', to: 'episodes#index', as: 'episodes_filtered'

   post 'media', to: 'media#fetch_embed', as: 'fetch_media_embed'
end

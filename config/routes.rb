Rails.application.routes.draw do
  get 'platforms', to: 'platforms#index', as: 'platforms'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'platforms/:key', to: 'platforms#show', as: 'platform'
  get 'platforms/:key/episodes', to: 'platforms#show_with_episodes', as: 'platform_with_episodes'
  get 'platforms/:key/refresh', to: 'platforms#refresh', as: 'platform_refresh'
end

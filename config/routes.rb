Rails.application.routes.draw do
  get 'platforms/index'

  get 'platforms/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'platforms/:key', to: 'platforms#show'
end

Rails.application.routes.draw do
  get 'bookings/new'

  get 'bookings/create'

  get 'villas/index'

  get 'villas/show'

 root to: 'pages#home'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :villas do
   resources :bookings, only: [:new, :create]
 end
 mount Attachinary::Engine => "/attachinary"
 devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
 # resources :users, only: [:edit, :update, :destroy]
end

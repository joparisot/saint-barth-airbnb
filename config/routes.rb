Rails.application.routes.draw do
 root to: 'pages#home'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
 resources :villas do
   resources :bookings, only: [:new, :create]
 end
 post 'bookings/:id/approve', to: 'bookings#approve', as: :approve
 post 'bookings/:id/reject', to: 'bookings#reject', as: :reject
 resources :users, only: [:edit, :update, :show]
 mount Attachinary::Engine => "/attachinary"
end

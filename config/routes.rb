Rails.application.routes.draw do
  devise_for :users
  resources :bookings
  resources :categories
  resources :rooms
  resources :hotels
  root :to => 'bookings#index'

  get 'dashboard', to: 'customers#dashboard'

  namespace :api do
    namespace :v1 do
      resources :bookings do
      	get :rooms_are_available , on: :collection
      end
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

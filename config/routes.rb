Rails.application.routes.draw do
  get "shelters/show"
  # Set homepage to breeds index
  root 'breeds#index'

  # About page route
  get 'about', to: 'about#index'

  # Resourceful routes for breeds and shelters (gives you index and show pages automatically)
  resources :breeds, only: [:index, :show]
  resources :shelters, only: [:show]

  # Reveal health status
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
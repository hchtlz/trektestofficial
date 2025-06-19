Rails.application.routes.draw do
  # mount ImageUploader.derivation_endpoint => "derivations/image"
  post "upload", to: "uploads#image", namespace: :admin
  namespace :admin do
    resources :users
    delete :logout, to: "user_sessions#destroy", as: :logout
    get :login, to: "user_sessions#new", as: :login
    resources :user_sessions, only: %i[new create destroy]
    resources :user_password_resets, only: %i[new create edit update]
    resources :pages, except: :show
    resources :fragments, except: :show
    namespace :panels do
      resources :prompts, only: [:new, :create]
      resources :links, only: [:new, :create]
      resources :images, only: [:new, :create, :edit, :update, :destroy]
    end
    root "dashboards#index"
  end
  Healthcheck.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end

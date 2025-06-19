Rails.application.routes.draw do
  # mount ImageUploader.derivation_endpoint => "derivations/image"
  mount Lookbook::Engine, at: "/lookbook" if Rails.env.development?
  post "upload", to: "uploads#image", namespace: :admin
  namespace :admin do
    namespace :panels do
      resources :prompts, only: [:new, :create]
      resources :links, only: [:new, :create]
      resources :images, only: [:new, :create, :edit, :update, :destroy]
    end
    root "dashboards#index"
  end
end

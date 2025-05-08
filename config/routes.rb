Rails.application.routes.draw do
  root "pages#explore"

  get "/acerca-de-nosotros", to: "pages#about"
  get "/galeria", to: "pages#gallery"
  get "/horarios", to: "pages#horarios"

  get "/contactanos", to: "contacts#new"
  post "/contactanos", to: "contacts#create"

  resource :session
  resources :passwords, param: :token

  # //Admin routes
  namespace :admin do
    get "contact_messages/index"
    get "contact_messages/show"
    resources :contact_messages, only: [ :index, :show ]
  end


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end

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
end

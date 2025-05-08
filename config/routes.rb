Rails.application.routes.draw do
  root "pages#home"

  get "/acerca-de-nosotros", to: "pages#about"
  get "/galeria", to: "pages#gallery"
  get "/horarios", to: "pages#horarios"
  resource :session
  resources :passwords, param: :token

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end

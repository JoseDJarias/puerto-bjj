Rails.application.routes.draw do
  root "pages#explore"

  get "/acerca-de-nosotros", to: "pages#about"
  get "/galeria", to: "pages#gallery"
  get "/horarios", to: "pages#horarios"

  get "/feedback", to: "feedbacks#new"
  post "/feedback", to: "feedbacks#create"

  resource :session
  resources :passwords, param: :token

  # Admin routes
  namespace :admin do
    root to: "dashboard#index"  # Esto hace que el dashboard sea la página principal del área admin
    resources :feedback_messages, only: [:index, :show]
  end
end

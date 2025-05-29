Rails.application.routes.draw do
  root "pages#explore"

  get "/acerca-de-nosotros", to: "pages#about"

  get "/feedback", to: "feedbacks#new"
  post "/feedback", to: "feedbacks#create"

  resource :session
  resources :passwords, param: :token

  # Admin routes
  namespace :admin do
    root to: "dashboard#index"  # Esto hace que el dashboard sea la página principal del área admin
    resources :feedback_messages, only: [:index, :show, :destroy] do
      collection do
        delete :batch_destroy
      end
    end
  end
end

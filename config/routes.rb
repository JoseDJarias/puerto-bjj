Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#explore"

  get "/about-us", to: "pages#about_us"

  # Programs routes
  get "programs", to: "pages#programs", as: :programs
  # Program details with specific key
  get "program/:id", to: "pages#program", as: :program

  get "/feedback", to: "feedbacks#new"
  post "/feedback", to: "feedbacks#create"

  resource :session
  resources :passwords, param: :token

  # Admin routes
  namespace :admin do
    root to: "dashboard#index"
    resources :feedback_messages, only: [ :index, :show, :destroy ] do
      collection do
        delete :batch_destroy
      end
    end
    resources :media_items
  end
end

Rails.application.routes.draw do
  root 'dashboard#index'
  get "/auth/google_oauth2", as: :google_login
  get 'auth/:provider/callback', to: 'sessions#create'
end

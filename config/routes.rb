Rails.application.routes.draw do
  root 'dashboard#index'

  get "/auth/google_oauth2", as: :google_login
  get 'auth/:provider/callback', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy', as: :session

  namespace "api", defaults: { :format => 'json' } do
    namespace "v1" do
      resources :users, only: [:show, :create, :destroy]
      resources :field_workers, only: [:index, :create, :update]
    end
  end
end

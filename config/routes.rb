Rails.application.routes.draw do
  root 'dashboard#index'

  get "/auth/google_oauth2", as: :google_login
  get 'auth/:provider/callback', to: 'sessions#create'

  namespace "api", defaults: { :format => 'json' } do
    namespace "v1" do
      resources :appointments, only: [:index, :show]
      resources :field_workers, only: [:index]
    end
  end
end

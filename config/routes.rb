Rails.application.routes.draw do
  root 'dashboard#index'

  namespace "api", defaults: { :format => 'json' } do
    namespace "v1" do
      resources :appointments, only: [:index, :show]
    end
  end
end

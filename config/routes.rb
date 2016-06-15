Rails.application.routes.draw do
  root 'dashboard#index'

  namespace "api", defaults: { :format => 'json' } do
    namespace "v1" do
      resources :users, only: [:show, :create, :destroy]
      resources :field_workers, only: [:index, :create, :update]
      resources :photographers, only: [:index]
      resources :appraisers, only: [:index]
    end
  end
end

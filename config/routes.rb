Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
  namespace :api do
    namespace :v1 do
      resource :session, only: %i[create] do
        post :signup, on: :collection
      end

      resource :users, only: %i[update show] do
        collection do
          get :show_profile
        end
        patch :toggle_portfolio_status, on: :member
      end

      resources :portfolios, only: %i[show] do
        get :show_public, on: :member
      end

      resources :educations, except: %i[edit show new]
      resources :projects, except: %i[edit show new]
      resources :experiences, except: %i[edit show new]
    end
  end
end

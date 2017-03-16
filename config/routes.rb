Rails.application.routes.draw do
  root to: 'top#index'

  resources :boards, only: %i(index show new create edit update)

  namespace :api do
    namespace :v1 do
      resources :boards, only: :create do
        resources :rows, only: :create
      end
    end
  end
end

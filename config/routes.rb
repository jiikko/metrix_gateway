Rails.application.routes.draw do
  root to: 'top#index'

  resources :boards, only: %i(index show new create edit update)

  namespace :api do
    namespace :v1 do
      resources :boards, only: [] do
        resources :rows, only: %i(create)
      end
    end
  end
end

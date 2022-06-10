Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: [:index, :show, :create, :update, :destroy]

  # api/v1/people
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :people, only: [:index, :show, :create, :update, :destroy]
      resources :categories, only: [:index, :show, :create, :update, :destroy] do
        resources :funds, only: [:index, :show, :create, :update, :destroy]
      end

      resources :transactions, only: [:index, :show]
    end
  end
end

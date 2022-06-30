Rails.application.routes.draw do
  
  root "static_pages#home"
  get 'booktours/show'
  get 'booktours/destroy'

  resources :tours do
    member do
      post 'booktours'
    end
  end
  
  resources :orders, only: [:create, :destroy]
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords'      }
end

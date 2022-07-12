Rails.application.routes.draw do

  get 'users/show'
  get 'users/new'
  get 'users/new'
  get 'users/index'

  delete 'users/:id/destroy', to: 'users#destroy', as: 'delete_user'
  # resources :users
  root "static_pages#home"
  get 'booktours/show'
  #post 'booktours/new'
  # get 'tours/new'
  get 'tours/:id/booktour/new', to: 'booktours#new', as: 'book_new_tour'
  post 'tours/:id/booktour', to: 'booktours#create'
  # get 'tours/:id/update_status', to: 'booktours#update_status', as: 'update_status'
  resources :booktours, only: [:new, :destroy, :show, :index, :update] do
    member do
      patch :update_status
    end
  end
  
  resources :tours do
    member do
      get :booktour
      patch :update_status
    end
    resources :reviews
  end
  # resources :orders, only: [:create, :destroy]
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords',
        users: '/users/show',
        omniauth_callbacks: 'users/omniauth_callbacks'
      }

end
# resources :booktours, only: [:new, :show, :destroy, :update]
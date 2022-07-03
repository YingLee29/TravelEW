Rails.application.routes.draw do
  
  get 'users/show'
  get 'users/new'
  get 'users/new'
  root "static_pages#home"
  get 'booktours/show'
  #post 'booktours/new'
  # get 'tours/new'
  get 'tours/:id/booktour/new', to: 'booktours#new', as: 'book_new_tour'
  post 'tours/:id/booktour', to: 'booktours#create'
  resources :booktours, only: [:new, :destroy, :show, :index]
  resources :tours do
    member do
      get :booktour
    end
  end
  # resources :orders, only: [:create, :destroy]
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords',
        users: '/users/show'     }
end
# resources :booktours, only: [:new, :show, :destroy, :update]
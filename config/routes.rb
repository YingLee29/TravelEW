Rails.application.routes.draw do
  # root "static_pages#home"
  # devise_for :users do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  resources :tours
  root 'tours#index'
end

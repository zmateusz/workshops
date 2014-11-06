Rails.application.routes.draw do
  get 'profile/show'
  # get 'profile/:id' => 'profile#show'

  devise_for :users
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  root 'categories#index'
  resources :products
end

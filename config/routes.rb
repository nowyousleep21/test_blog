Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments, only: %i[create destroy]
    get :purge, on: :member
    get :only_self, on: :collection
  end

  root to: 'posts#index', as: 'home'
end

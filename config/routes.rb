Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    get :purge, on: :member
  end

  root to: 'posts#index', as: 'home'
end

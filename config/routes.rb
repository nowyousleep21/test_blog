Rails.application.routes.draw do
  resources :posts do
    get :purge, on: :member
  end

  root to: 'posts#index', as: 'home'
end

Rails.application.routes.draw do
  root "posts#index", as: "home"
  get 'signup', to: 'authors#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :posts do
    resources :comments do
      member do
        post :publish
      end
    end
  end
  resources :authors
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

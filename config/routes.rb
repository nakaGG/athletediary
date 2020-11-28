Rails.application.routes.draw do
  devise_for :users, controllers: {
   omniauth_callbacks: 'users/omniauth_callbacks',
   registrations: 'users/registrations'
  }
  root to: "diaries#index"
  resources :diaries, only: [:new, :create, :show]
  resources :users, only: :new  
end

Rails.application.routes.draw do
  root to: "diaries#index"
  resources :users, only: :new  
end

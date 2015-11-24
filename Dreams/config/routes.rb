Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :goals, except: [:index]

  resources :user_comments, only: [:new, :create, :destroy]
  resources :goal_comments, only: [:new, :create, :destroy]
end

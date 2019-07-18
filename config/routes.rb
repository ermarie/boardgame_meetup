Rails.application.routes.draw do

  get 'mechanisms/show'
  get 'categories/show'
  devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "callbacks" }
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  root to: "application#home"

  resources :users, only: [:show] do
    get :one_day
    get :seven_days
    get :thirty_days
  end
  #resources :groups, only: [:show]

  resources :groups do 
    get :join
    get :leave
    resources :events, only: [:new, :create, :show, :edit, :update, :destroy] do
      get :join
      get :leave
    end
  end
  
  resources :games
  #resources :categories, :mechanisms, only: [:index, :show]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

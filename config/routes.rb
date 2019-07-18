Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "callbacks" }
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  resources :users, only: [:show]
  #resources :groups, only: [:show]

  resources :groups do 
    get "join"
    resources :events, only: [:new, :create, :show, :edit, :update, :destroy] do
      get "join"
    end
  end
  
  resources :events
  #resources :events, :games, :categories, :mechanisms

  root to: "application#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

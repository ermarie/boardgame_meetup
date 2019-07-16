Rails.application.routes.draw do
  get 'groups/new'
  get 'groups/create'
  get 'groups/view'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  devise_for :users, :controllers => {registrations: "registrations" }
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  resource :groups do 
    resource :events
  end
    
    
  resource :events, :games, :categories, :mechanisms

  root to: "sessions#new"
  root to: "appliation#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

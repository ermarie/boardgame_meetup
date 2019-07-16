Rails.application.routes.draw do
  get 'events/new'
  get 'events/create'
  get 'events/index'
  get 'events/show'
  get 'events/edit'
  get 'events/delete'
  get 'groups/new'
  get 'groups/create'
  get 'groups/view'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "callbacks" }
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    #get 'logout', to: 'devise/sessions#destroy'
  end

  resource :groups do 
    resource :events
  end
    
    
  resource :events, :games, :categories, :mechanisms

  root to: "application#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

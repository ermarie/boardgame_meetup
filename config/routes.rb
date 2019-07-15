Rails.application.routes.draw do
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

  resource :groups, :events, :games, :categories, :mechanisms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

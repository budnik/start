Start::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin' ->

  resources :activities, only: [:show, :apply]
  resources :people, only: :show

  devise_for :volunteers, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :volunteer do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  authenticated :volunteer do
    get 'me', to: 'volunteers#me'
  end
  root :to => 'welcome#index'
end

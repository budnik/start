Start::Application.routes.draw do
  devise_for :volunteers, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :volunteer do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  root :to => 'welcome#index'
end

Rails.application.routes.draw do

  resources :donates
  resources :donate_things
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    # root :to => 'devise/sessions#new'
  end

  root 'donates#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  resources :donates do
    get 'download', to: 'donates#download'

    # collection do
    #   get 'download', to: 'donates#download'
    # end
  end

  resources :invoices

  resources :donate_things do
    get 'download'
    # get 'download', to: 'donate_things#download'
  end

  resources :output_donates

  resources :dashboards

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    # root :to => 'devise/sessions#new'
  end

  root 'dashboards#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Questions::Application.routes.draw do

  root to: 'dashboard#home'
  devise_for :users, :path => 'devise'

  resources :projects do
    member do
      get 'questions'
      get 'new_question'
      get 'versions' => 'versions#index'
      get 'new_version' => 'versions#new'
      post 'new_version' => 'versions#create'
    end
  end

  resources :versions, :only => [:show] do
    member do
      get 'new_manual_test' => 'manual_tests#new'
      post 'new_manual_test' => 'manual_tests#create'
    end
  end

  resources :manual_tests, :only => [:show, :update, :destroy] do
    get 'submit'
    get 'verify'
    get 'deny'
  end

  resources :questions
  resources :answers, :only => [:create]
  resources :users

  get 'profile' => 'profile#show', :as => 'profile'
  put 'profile' => 'profile#update', :as => 'update_profile'

end

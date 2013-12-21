Questions::Application.routes.draw do

  root to: 'dashboard#home'
  devise_for :users, :path => 'devise'

  resources :projects do
    member do
      get 'questions'
      get 'new_question'
    end
  end

  resources :questions
  resources :answers, :only => [:create]
  resources :users

  get 'profile' => 'profile#show', :as => 'profile'
  put 'profile' => 'profile#update', :as => 'update_profile'

end

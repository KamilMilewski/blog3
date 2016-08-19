Rails.application.routes.draw do
  devise_for :users
  get 'contacts/controller'

  root 'welcome#index'
  get 'welcome/index'
 
  resources :posts
  resources :projects
  resources :contacts, only: [:new, :create]
end

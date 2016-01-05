Rails.application.routes.draw do

  resources :posts

  get 'welcome/index'

  get 'about' => 'welcome#about'

  root 'welcome#index'

  end

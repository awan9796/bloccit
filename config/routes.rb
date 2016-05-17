Rails.application.routes.draw do

  resources :labels, only: [:show]

  resources :topics do
    resources :posts, except: [:index]
    resources :comments, only: [:create, :destroy]#, except: [:index]

  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

    #resources :comments, only: [:show, :create, :destroy] do

    #end


    resources :favourites, only: [:create, :destroy] do

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'

  root 'welcome#index'

end

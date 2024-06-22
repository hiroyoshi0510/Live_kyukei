Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/posts/:id/delete' => 'posts#destroy', as: :delete_post

  get 'posts/:post_id/likes' => 'likes#create'#追記
  get 'posts/:post_id/likes/:id' => 'likes#destroy'#追記

  resources :users, only: [:show] # ユーザーマイページへのルーティング


  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  root 'posts#index'







  
end

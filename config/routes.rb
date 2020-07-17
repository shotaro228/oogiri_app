Rails.application.routes.draw do

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#top"
  
  get "answers/:id/liked" => "answers#liked"
  get "answers/:id/commented" => "answers#commented"
  resources :answers
  
  post "users/login" => "users#login"
  post "users/logout" => "users#logout"
  get "users/:id/followed" => "users#followed"    
  get "users/:id/follow_to" => "users#follow_to"
  resources :users
  
  namespace :admin do
    post "users/login" => "users#login"
    post "users/logout" => "users#logout"
    get "users/:id/followed" => "users#followed"
    get "users/:id/follow_to" => "users#follow_to"
  resources :users
  end
  
  get "comments/:id/new" => "comments#new", as: "new_comment"
  post "comments/:id/create" => "comments#create", as: "comments"
  get "comments/:id/edit" => "comments#edit", as: "edit_comment"
  post "comments/:id/destroy" => "comments#destroy"
  patch "comments/:id" => "comments#update", as: "comment"
  get "comments/:id/liked" => "comments#liked"
  
  post "likes/:answer_id/create" => "likes#create"
  post "likes/:answer_id/destroy" => "likes#destroy"
  
  post "commentlikes/:comment_id/create" => "commentlikes#create"
  post "commentlikes/:comment_id/destroy" => "commentlikes#destroy"
  
  resources :follows, only: [:create, :destroy]
end
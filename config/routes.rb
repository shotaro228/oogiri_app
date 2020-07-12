Rails.application.routes.draw do

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#top"
  
  get "answers/rank" => "answers#rank"
  resources :answers
  
  post "users/login" => "users#login"
  post "users/logout" => "users#logout"
  resources :users
  
  get "comments/:id/new" => "comments#new", as: "new_comment"
  post "comments/:id/create" => "comments#create", as: "comments"
  get "comments/:id/edit" => "comments#edit", as: "edit_comment"
  post "comments/:id/destroy" => "comments#destroy"
  patch "comments/:id" => "comments#update", as: "comment"
  
  post "likes/:answer_id/create" => "likes#create"
  post "likes/:answer_id/destroy" => "likes#destroy"
  
  post "commentlikes/:comment_id/create" => "commentlikes#create"
  post "commentlikes/:comment_id/destroy" => "commentlikes#destroy"
  
  resources :follows, only: [:create, :destroy]
end

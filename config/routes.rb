Rails.application.routes.draw do

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/" => "home#top"
  
  get "answer/index" => "answers#index"
  get "answer/new" => "answers#new"
  post "answer/create" => "answers#create"
  get "answer/rank" => "answers#rank"
  get "answer/:id" => "answers#show"
  get "answer/:id/edit" => "answers#edit"
  post "answer/:id/update" => "answers#update"
  post "answer/:id/destroy" => "answers#destroy"
  
  get "user/index" => "users#index"
  get "user/new" => "users#new"
  post "user/create" => "users#create"
  get "user/login" => "users#login_form"
  post "user/login" => "users#login"
  post "user/logout" => "users#logout"
  get "user/:id" => "users#show"
  get "user/:id/edit" => "users#edit"
  post "user/:id/update" => "users#update"
  post "user/:id/destroy" => "users#destroy"
  
  get "comment/new" => "commments#new"
  post "comment/create" => "comments#create"
  get "comment/:id/edit" => "comments#edit"
  post "comment/:id/update" => "comments#update"
  post "comment/:id/destroy" => "comments#destroy"
  
end

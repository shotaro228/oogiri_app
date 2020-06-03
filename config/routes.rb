Rails.application.routes.draw do

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#top"
  
  get "answers/rank" => "answers#rank"
  resources :answers
  
  get "user/login" => "users#login_form"
  post "user/login" => "users#login"
  post "user/logout" => "users#logout"
  resources :users
  
  get "comment/new" => "commments#new"
  post "comment/create" => "comments#create"
  get "comment/:id/edit" => "comments#edit"
  post "comment/:id/update" => "comments#update"
  post "comment/:id/destroy" => "comments#destroy"
  
end

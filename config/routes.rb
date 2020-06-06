Rails.application.routes.draw do

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#top"
  
  get "answers/rank" => "answers#rank"
  resources :answers
  
  get "users/login" => "users#login_form"
  post "users/login" => "users#login"
  post "users/logout" => "users#logout"
  resources :users
  
  get "comments/new" => "comments#new"
  post "comments/create" => "comments#create"
  get "comments/:id/edit" => "comments#edit"
  post "comments/:id/update" => "comments#update"
  post "comments/:id/destroy" => "comments#destroy"
  
end

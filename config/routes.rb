Rails.application.routes.draw do

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#top"
  
  get "answers/rank" => "answers#rank"
  resources :answers
  
  post "users/login" => "users#login"
  post "users/logout" => "users#logout"
  resources :users
  
  get "comments/:id/new" => "comments#new"
  post "comments/:id/create" => "comments#create"
  get "comments/:id/edit" => "comments#edit"
  post "comments/:id/update" => "comments#update"
  post "comments/:id/destroy" => "comments#destroy"
  
  post "likes/:answer_id/create" => "likes#create"
  post "likes/:answer_id/destroy" => "likes#destroy"
end

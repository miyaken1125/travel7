Rails.application.routes.draw do

  get 'comments/new'
  get 'comments/index'
  get 'comments/:id/show', to: 'comments#show', as: 'comment_show'
  post 'comments/create', to: 'comments#create', as: 'comment_create'
 

  get 'posts/index', to: "posts#index", as: "post_index"
  get 'posts/new', to: "posts#new", as: "post_new"
  # get 'posts/show', to: "posts#show", as: "post_show"
# ↓to: 'users#show'のコントローラーを見に行く。  
  get 'posts/:id/show', to: 'posts#show', as: 'post_show'
  post 'posts/create', to: 'posts#create', as: 'post_create'
  
  get 'users/login_form', to: "users#login_form", as: "signin"
  post 'users/login', to: "users#login", as: "login"
  post 'users/logout', to: 'users#logout', as: 'user_logout'
  get 'users/index', to: "users#index", as: "user_index"
  root 'users#new'
# ↓to: 'users#show'のコントローラーを見に行く。
  get 'users/:id/show', to: 'users#show', as: 'show'
  post 'users/create', to: 'users#create', as: 'user_create'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

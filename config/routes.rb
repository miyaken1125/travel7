Rails.application.routes.draw do

  # 他ユーザーコメント
  get 'comments/new'
  get 'comments/index'
  # URL の名前を付与　つけてあげているのだ。　名前"comment/show"⇒htmlにつながる
  get 'comments/:id/show', to: 'comments#show', as: 'comment/show'
  post 'comments/create', to: 'comments#create', as: 'comment_create'
 
# 　投稿画面
  get 'posts/index', to: 'posts#index', as: 'post_index'
  get 'posts/new', to: 'posts#new', as: 'post_new'
# ↓to: 'users#show'のコントローラーを見に行く。  
  get 'posts/:id/show', to: 'posts#show', as: 'post_show'
  post 'posts/create', to: 'posts#create', as: 'post_create'
  
  # ユーザー登録画面
  get 'users/login_form', to: 'users#login_form', as: 'signin'
  post 'users/login', to: 'users#login', as: 'login'
  post 'users/logout', to: 'users#logout', as: 'user_logout'
  get 'users/index', to: 'users#index', as: "user_index"
  root 'users#new'
# ↓to: 'users#show'のコントローラーを見に行く。
  get 'users/:id/show', to: 'users#show', as: 'show'
  post 'users/create', to: 'users#create', as: 'user_create'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/show'
# ↓to: 'users#show'のコントローラーを見に行く。  
  get 'posts/:id/show', to: 'posts#show', as: 'post/show'
  post 'posts/create', to: 'posts#create', as: 'post_create'
  
 
  get 'users/index'
  root 'users#new'
# ↓to: 'users#show'のコントローラーを見に行く。
  get 'users/:id/show', to: 'users#show', as: 'show'
  post 'users/create', to: 'users#create', as: 'user_create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

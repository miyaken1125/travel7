Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/show'
  post 'create', to: 'posts#create', as: 'post_create'
  
 
  get 'users/index'
  root 'users#new'
  get 'users/show', to: 'users#show', as: 'show'
  post 'create', to: 'users#create', as: 'user_create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

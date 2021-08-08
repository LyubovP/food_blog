Rails.application.routes.draw do
  devise_for :users
  get 'post/new'
  
  #get 'post/creat'
  get 'pages/home'
  root to: 'pages#home'
  resources :post
end

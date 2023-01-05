Rails.application.routes.draw do


  devise_for :admin

  devise_for :user,path: 'patrie'

  namespace :admin do

  end
  scope module: :user do
    root 'homes#top'
    resources :posts
    resources :likes
    resources :notifications
    resources :relationships
    resources :comments
    resources :users


  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

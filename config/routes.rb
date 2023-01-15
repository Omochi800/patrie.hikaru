Rails.application.routes.draw do


  devise_for :admin

  devise_for :user,path: 'patrie'

  namespace :admin do

  end
  scope module: :user do
    root 'homes#top'
    get 'follow/:id' => 'relationships#follow', as: 'follow'
    get 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
    resources :posts do
      get :search,on: :colection
      resources :comments, only: [:create,:destroy]
      resource :likes, only: [:create, :destroy]
    end

    resources :notifications
    resources :relationships
    resources :users


  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

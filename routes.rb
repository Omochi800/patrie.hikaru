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
      resources :comments, only: [:create,:destroy]
      resource :likes, only: [:create, :destroy]
    end

    resources :notifications,only: [:index]
    resources :relationships
    resources :users
    get '/search', to: 'searchs#search'
    get "/user/unsubscribe" => "users#unsubscribe"
    patch "/user/withdraw" => "users#withdraw"


  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
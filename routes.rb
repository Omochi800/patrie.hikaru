Rails.application.routes.draw do

  devise_for :users,:controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  namespace :admin do
    resources :posts
    resources:users

  end

  scope module: :user do
    root 'homes#top'
    resources :users
    get 'follow/:id' => 'relationships#follow', as: 'follow'
    get 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
    resources :posts do
      resources :comments, only: [:create,:destroy]
      resource :likes, only: [:create, :destroy]
    end

    resources :notifications,only: [:index]
    resources :relationships
    get '/search', to: 'searches#search'
    get "/user/unsubscribe" => "users#unsubscribe"
    patch "/user/withdraw" => "users#withdraw"


  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
Rails.application.routes.draw do


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :user,path: 'patrie', controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}


  namespace :admin do
    root to:"homes#top"
    resources :posts
    resources :users
  end
  scope module: :user do
    root 'homes#top'
    get '/about' => 'homes#about'
    resources :posts do
      resources :comments, only: [:create,:destroy]
      resource :likes, only: [:create, :destroy]
    end
    post 'follow/:id' => 'relationships#follow', as: 'follow'
    post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
    resources :notifications,only: [:index,:destroy]
    resources :relationships
    resources :users
    get "/user/unsubscribe" => "users#unsubscribe"
    patch "/user/withdraw" => "users#withdraw"
  end
  get '/search' => 'searches#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

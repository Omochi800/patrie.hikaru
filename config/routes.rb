Rails.application.routes.draw do



  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :user,path: 'patrie',controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

  namespace :admin do

  end
  devise_scope :user do
    root to:'homes#top'
    resources :posts
    resources :likes
    resources :notifications
    resources :relationships
    resources :comments


  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

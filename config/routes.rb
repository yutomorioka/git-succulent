Rails.application.routes.draw do

  # 顧客用
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_scope :user do
  post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
end

scope module: :public do
  root 'homes#top'
  get 'search' => 'homes#search', as: 'search'
  get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'

  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      get :favorites
    end
  end
  resources :post_plants, only: [:new, :show, :index, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end
end

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  root to: "homes#top"
  get 'users/:user_id/post_plants' => 'post_plants#index', as: 'user_post_plants'
  resources :users, only: [:index, :show, :edit, :update]
  resources :plants, only: [:index, :create, :show, :edit, :update]
  resources :post_plants, only: [:index, :show, :edit, :update, :destroy] do
    resources :comments, only: [:destroy]
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

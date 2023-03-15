Rails.application.routes.draw do

  namespace :public do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  # 顧客用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do
    root 'homes#top'
    get 'search' => 'homes#search', as: 'search'
    resources :users, only: [:new, :show, :index, :create, :edit, :update, :destroy]
    resources :post_plants, only: [:new, :show, :index, :create, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]  
    end
end

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  get 'top' => 'homes#top', as: 'top'
  resources :plants, only: [:index, :create, :show, :edit, :update]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

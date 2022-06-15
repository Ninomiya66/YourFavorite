Rails.application.routes.draw do

  root 'public/homes#top'

  # 顧客用
  # URL /customers/sign_in...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do

    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'check'
        patch 'out'
      end
    end

    resources :reviews, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

  end

  # 管理者用
  # URL /admin/sign_in...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

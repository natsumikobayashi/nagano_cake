Rails.application.routes.draw do

    #管理者用
  #URL/customers/sign_in...
  devise_for :admin ,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  root to: "public/homes#top"

   scope module: :public do
    resources :items, only:[:index, :show]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only:[:new, :create, :index, :show]
    get 'homes/about' => 'homes#about',as: 'about'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/subscribe'=> 'customers#subscribe'
    resource :customers, only:[:show, :edit, :update]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all' #:idに吸収されないように上に書く
    resources :cart_items, only: [:index, :update, :destroy, :create]
  end

   namespace :admin do #これから
    get 'homes/top' => 'homes#top'
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    patch 'items/update' => 'items#update'
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    end

  #会員用
  #URL/admin/sign_in...
  devise_for :customers,skip: [:passwords],  controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

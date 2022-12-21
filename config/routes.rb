Rails.application.routes.draw do
    #管理者用
  #URL/customers/sign_in...
  devise_for :admin ,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #会員用
  #URL/admin/sign_in...
  devise_for :customers,skip: [:passwords],  controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  root to: "public/homes#top"

   scope module: :public do
    resources :items, only:[:index, :show]
    resources :orders, only:[:new, :create, :index, :show]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    get 'homes/about' => 'homes#about',as: 'about'
    get 'customers/show' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers/update' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/subscribe'=> 'customers#subscribe'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  end

   namespace :admin do #これから
    get 'homes/top' => 'homes#top'
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    patch 'items/update' => 'items#update'
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    get 'order_details/update'
    get 'orders/show'
    get 'orders/update'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

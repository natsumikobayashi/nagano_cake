Rails.application.routes.draw do
  #devise_for :users
  #get 'home/about' => 'homes#about',as: 'about'

  #resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  #resources :users, only: [:show, :edit, :update, :index]
  
  root to: "public/homes#top"
  
  namespace :public do
    get 'homes/top'
    get 'homes/about'
    get 'items/index'
    get 'items/show'
    resources :customers, only: [:show, :edit, :update]
    get 'customers/confirm'
    patch 'customers/subscribe'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items/destroy_all'
    
  end
  
   namespace :admin do
    get 'homes/top'
    get 'order_details/update'
    get 'orders/show'
    get 'orders/update'
  end
  
  #管理者用
  #URL/customers/sign_in...
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  
  #会員用
  #URL/admin/sign_in...
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

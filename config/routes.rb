Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  get 'admin', to: 'admin/orders#index'



  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :customers, only:[:index, :show, :edit, :update, :destroy]
  end

  scope module: :customer do
    resources :delivery_addresses, only: [:index, :create, :edit, :update, :destroy]
    get 'orders/complete', to: 'orders#complete'
    post 'orders/confirm', to: 'orders#confirm'
    resources :orders
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create] do
    collection do
    delete "destroy_all" => "cart_items#destroy_all"
    end
    end
    post 'search'
  end

  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


 get 'admins' => 'admin/homes#top'

 root to: 'customer/homes#top'
 get 'customers/my_page' => 'customer/customers#show',as: :customers_my_page
 get 'customers/information/edit' => 'customer/customers#edit',as: :customers_my_page_edit
 patch 'customers/information' => 'customer/customers#update'
 get 'customers/quit' => 'customer/customers#quit',as: :customers_quit
 patch 'customers/out' => 'customer/customers#out'

end
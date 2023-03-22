Rails.application.routes.draw do

  root to: 'customer/homes#top'

  get 'items/index'
  get 'items/show'
  get '/about' => 'customer/homes#about', as: "about"

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
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update, :destroy]
  end

  scope module: :customer do
    resources :delivery_addresses, only: [:index, :create, :edit, :update, :destroy]
      resources :items, only: [:index, :show]
      resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete "destroy_all" => "cart_items#destroy_all"
      end
    end
  end
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


 get '/admins' => 'admin/homes#top'

 get 'customers/my_page/:id' => 'customer/customers#show'
 get 'customers/information/edit' => 'customer/customers#edit'
 get 'customers/information' => 'customer/customers#update'
 get 'customers/quit' => 'customer/customers#quit'
 get 'customers/out' => 'customer/customers#out'

end
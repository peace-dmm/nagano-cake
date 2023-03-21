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
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  scope module: :customer do
    resources :delivery_addresses, only: [:index, :create, :edit, :update, :destroy]
  end
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

get 'admins' => 'admin/homes#top'

 root to: 'customer/homes#top'
 get 'customers/my_page/:id' => 'customer/customers#show'
 get 'customers/information/edit' => 'customer/customers#edit'
 get 'customers/information' => 'customer/customers#update'
 get 'customers/quit' => 'customer/customers#quit'
 get 'customers/out' => 'customer/customers#out'

end